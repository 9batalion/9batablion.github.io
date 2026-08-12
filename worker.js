export default {
 async fetch(request, env) {
  const headers={"Access-Control-Allow-Origin":"*","Access-Control-Allow-Headers":"Authorization, Content-Type","Access-Control-Allow-Methods":"GET, PUT, OPTIONS","Content-Type":"application/json; charset=utf-8"};
  if(request.method==="OPTIONS") return new Response(null,{status:204,headers});
  const auth=request.headers.get("Authorization")||"";
  if(!env.SYNC_TOKEN || auth!==`Bearer ${env.SYNC_TOKEN}`) return new Response(JSON.stringify({error:"unauthorized"}),{status:401,headers});
  const url=new URL(request.url); if(url.pathname!=="/state") return new Response(JSON.stringify({error:"not_found"}),{status:404,headers});
  const current=JSON.parse((await env.AQUA_SYNC.get("state"))||'{"revision":0,"updatedAt":null,"payload":null}');
  if(request.method==="GET") return new Response(JSON.stringify(current),{headers});
  if(request.method==="PUT"){
   let body; try{body=await request.json()}catch{return new Response(JSON.stringify({error:"invalid_json"}),{status:400,headers})}
   const base=Number(body.baseRevision||0); if(base!==Number(current.revision||0)) return new Response(JSON.stringify({error:"revision_conflict",revision:current.revision,updatedAt:current.updatedAt}),{status:409,headers});
   if(!body.payload) return new Response(JSON.stringify({error:"missing_payload"}),{status:400,headers});
   const next={revision:Number(current.revision||0)+1,updatedAt:new Date().toISOString(),payload:body.payload};
   await env.AQUA_SYNC.put("state",JSON.stringify(next));
   return new Response(JSON.stringify({revision:next.revision,updatedAt:next.updatedAt}),{headers});
  }
  return new Response(JSON.stringify({error:"method_not_allowed"}),{status:405,headers});
 }
};
