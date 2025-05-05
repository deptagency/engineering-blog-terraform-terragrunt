export const handler = async ()=> {
  try {
    const now = new Date();
    const nowStr = `Hello. The current system date is ${now}`;
    console.log(nowStr);

    return {
      statusCode: 200,
      body: JSON.stringify({ message: `${nowStr}` }),
    }

  } catch (error) {
    console.error("Error in Hello Time JS", error);

    return {
      statusCode: 500,
      body: JSON.stringify({ message: "Internal Server Error", error: error.message }),
    };
  }
};
