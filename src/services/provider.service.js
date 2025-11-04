module.exports = {
  async purchase({ service_code, phone, amount, reference }) {

    await new Promise(r => setTimeout(r, 500));

    const success = Math.random() < 0.9;
    return {
      success,
      ref: success ? `PROV-${reference}` : null,
      message: success ? 'OK' : 'FAILED'
    };
  }
};