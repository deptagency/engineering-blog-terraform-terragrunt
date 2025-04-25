export const handler = async ()=> {
  try {
    const now = new Date();
    const nowStr = `Hello. The current system date is ${now}`;
    console.log(nowStr);

    const nowJsonStr = `{ "helloTime": "${nowStr}" }`;
    const nowJson = JSON.parse(nowJsonStr);
    console.log(nowJson);

    return nowJson;

  } catch (error) {
    console.error("Error in Hello Time JS", error);

    return {
      statusCode: 500,
      body: JSON.stringify({ message: "Internal Server Error", error: error.message }),
    };
  }
};
