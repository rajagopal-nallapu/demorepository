const notify = (type, message) => {
  $.toast({
    text: message,
    icon: type,
    loader: false,
    position: "top-right",
    hideAfter: 5000,
  });
};

const validateUser = () => {
  var formData = $("#registration").serialize();
  $.ajax({
    url: baseUrl + "/user/registerUser",
    method: "POST",
    data: formData,
    success: (data) => {
      let Obj = JSON.parse(data);
      if (Obj.status == "success") {
        window.location.href =
          baseUrl +
          "base/billing_info?firstName=" +
          Obj.firstName +
          "&lastName=" +
          Obj.lastName +
          "&regId=" +
          Obj.registrationId;
      } else if (Obj.status == "fail") {
        notify("error", Obj.message);
      }
    },
  });
};

$.validate({
  form: "#registration",
  borderColorOnError: "#d72315",
  addValidClassOnAll: true,
  onSuccess: () => {
    validateUser();
    return false;
  },
});

/**
 * To submit the card details to Recurly and get the token
 * @yield Recurly Token
 */
const getRecurlyToken = () => {
  return new Promise((resolve, reject) => {
    const form = document.querySelector("#billing-info-form");
    recurly.token(elements, form, function (err, token) {
      if (err) {
        $(".recurly-element").attr("style", "border-color: #d72315;");
        notify("error", err.message);
        reject(err.message);
      } else {
        resolve(token);
      }
    });
  });
};
 
/**
 * To validate the shipping address
 */

$.validate({
  form: "#billing-info-form",
  borderColorOnError: "#d72315",
  addValidClassOnAll: true,
});

/**
 * Submit the billing information form after validation
 */
const submitBillingInfo = () => {
  return new Promise((resolve, reject) => {
    var formData = $("#billing-info-form").serialize();
    $.ajax({
      url: baseUrl + "user/addBillingInformation",
      method: "POST",
      data: formData,
      success: (data) => {
        let Obj = JSON.parse(data);
        if (Obj.status == "success") {
          window.location.href =
            baseUrl +
            "base/upsell_oto?c_id=" +
            Obj.company_id +
            "&rac_code=" +
            Obj.recurly_account_code;
        } else if (Obj.status == "fail") {
          notify("error", Obj.message);
        }
      },
    });
    return false;
  });
};

$("#billing-info-form").submit((e) => {
  e.preventDefault();
  getRecurlyToken()
    .then((token) => {
      submitBillingInfo();
    })
    .catch((err) => {
      notify("error", Obj.message);
    });
});
