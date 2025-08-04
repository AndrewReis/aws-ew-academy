export const run = async (event, context) =>{
  console.log(JSON.stringify(event, null, 2));
  console.log(JSON.stringify(context, null, 2));

  return {
    statusCode: 200,
    body: JSON.stringify({
      hello: 'Hello by CLI. lambda no frameworks'
    })
  }
}