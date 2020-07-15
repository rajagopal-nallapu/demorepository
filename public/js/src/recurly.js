recurly.configure(recurlyPublicKey);

const elements = recurly.Elements();
const cardElement = elements.CardElement();
cardElement.attach("#recurly-elements");
