---
title: Sử dụng Payment Request API
slug: Web/API/Payment_Request_API/Using_the_Payment_Request_API
page-type: guide
---

{{DefaultAPISidebar("Payment Request API")}}

[Payment Request API](/en-US/docs/Web/API/Payment_Request_API) cung cấp một cách dựa trên trình duyệt để kết nối người dùng và các hệ thống, nền tảng thanh toán họ ưa thích với những người bán mà họ muốn trả tiền cho hàng hóa và dịch vụ. Bài viết này là hướng dẫn sử dụng [Payment Request API](/en-US/docs/Web/API/Payment_Request_API), kèm ví dụ và các thực hành tốt được đề xuất.

## Những điều cơ bản khi thanh toán

Phần này trình bày các bước cơ bản để dùng Payment Request API nhằm thực hiện thanh toán.

> [!NOTE]
> Các đoạn mã trong phần này đến từ bản [Feature detect support demo](https://github.com/mdn/dom-examples/blob/main/payment-request/feature-detect-support.html) của chúng tôi.

### Tạo một đối tượng payment request mới

Một payment request luôn bắt đầu bằng việc tạo một đối tượng {{domxref("PaymentRequest")}} mới - dùng hàm khởi tạo {{domxref("PaymentRequest.PaymentRequest", "PaymentRequest()")}}. Hàm này nhận hai tham số bắt buộc và một tham số tùy chọn:

- `methodData` - một đối tượng chứa thông tin về payment provider, chẳng hạn những phương thức thanh toán nào được hỗ trợ, v.v.
- `details` - một đối tượng chứa thông tin về giao dịch cụ thể, chẳng hạn tổng số tiền, thuế, chi phí vận chuyển, v.v.
- `options` (tùy chọn) - một đối tượng chứa các tùy chọn bổ sung liên quan đến thanh toán.

Ví dụ, bạn có thể tạo một thể hiện `PaymentRequest` mới như sau:

```js
const request = new PaymentRequest(
  buildSupportedPaymentMethodData(),
  buildShoppingCartDetails(),
);
```

Các hàm được gọi bên trong hàm khởi tạo trả về những đối tượng tham số cần thiết:

```js
function buildSupportedPaymentMethodData() {
  // Ví dụ các phương thức thanh toán được hỗ trợ:
  return [{ supportedMethods: "https://example.com/pay" }];
}

function buildShoppingCartDetails() {
  // Gán cứng cho mục đích demo:
  return {
    id: "order-123",
    displayItems: [
      {
        label: "Example item",
        amount: { currency: "USD", value: "1.00" },
      },
    ],
    total: {
      label: "Total",
      amount: { currency: "USD", value: "1.00" },
    },
  };
}
```

### Bắt đầu quá trình thanh toán

Sau khi đối tượng `PaymentRequest` đã được tạo, bạn gọi phương thức {{domxref("PaymentRequest.show()")}} trên nó để khởi động yêu cầu thanh toán. Phương thức này trả về một promise sẽ được hoàn tất với một đối tượng {{domxref("PaymentResponse")}} nếu thanh toán thành công:

```js
request.show().then((paymentResponse) => {
  // Ở đây chúng ta sẽ xử lý thanh toán. Trong demo này, mô phỏng thành công ngay lập tức:
  paymentResponse.complete("success").then(() => {
    // Chỉ dùng cho mục đích demo:
    introPanel.style.display = "none";
    successPanel.style.display = "block";
  });
});
```

Đối tượng này cung cấp cho nhà phát triển quyền truy cập vào các chi tiết có thể dùng để hoàn tất những bước logic sau khi thanh toán xong, chẳng hạn địa chỉ email để liên hệ khách hàng, địa chỉ giao hàng để gửi hàng, v.v. Trong đoạn mã trên, bạn sẽ thấy chúng ta đã gọi phương thức {{domxref("PaymentResponse.complete()")}} để báo rằng tương tác đã kết thúc - bạn sẽ dùng nó để thực hiện các bước hoàn tất, như cập nhật giao diện để cho người dùng biết giao dịch đã hoàn tất, v.v.

### Các phương thức payment request hữu ích khác

Có một số phương thức payment request hữu ích khác đáng biết.

{{domxref("PaymentRequest.canMakePayment()")}} có thể được dùng để kiểm tra xem đối tượng `PaymentRequest` có khả năng thực hiện thanh toán hay không trước khi bạn bắt đầu quy trình thanh toán. Nó trả về một promise sẽ được hoàn tất với một giá trị boolean cho biết có hay không, ví dụ:

```js
// Payment request giả để kiểm tra xem có thể thanh toán hay không
new PaymentRequest(buildSupportedPaymentMethodData(), {
  total: { label: "Stub", amount: { currency: "USD", value: "0.01" } },
})
  .canMakePayment()
  .then((result) => {
    if (result) {
      // Payment request thật
      const request = new PaymentRequest(
        buildSupportedPaymentMethodData(),
        checkoutObject,
      );
      request.show().then((paymentResponse) => {
        // Ở đây chúng ta sẽ xử lý thanh toán.
        paymentResponse.complete("success").then(() => {
          // Hoàn tất xử lý thanh toán
        });
      });
    }
  });
```

{{domxref("PaymentRequest.abort()")}} có thể được dùng để hủy payment request nếu cần.

## Phát hiện khả dụng của Payment Request API

Bạn có thể phát hiện hỗ trợ cho Payment Request API một cách hiệu quả bằng cách kiểm tra xem trình duyệt của người dùng có hỗ trợ {{domxref("PaymentRequest")}} hay không, tức `if (window.PaymentRequest)`.

Trong đoạn mã sau, một trang người bán thực hiện kiểm tra này, và nếu kết quả là `true` thì cập nhật nút thanh toán để dùng `PaymentRequest` thay cho các biểu mẫu web cũ.

```js
const checkoutButton = document.getElementById("checkout-button");
if (window.PaymentRequest) {
  let request = new PaymentRequest(
    buildSupportedPaymentMethodNames(),
    buildShoppingCartDetails(),
  );
  checkoutButton.addEventListener("click", () => {
    request
      .show()
      .then((paymentResponse) => {
        // Xử lý thanh toán thành công
      })
      .catch((error) => {
        // Xử lý thanh toán bị hủy hoặc thất bại. Ví dụ, chuyển hướng tới
        // quy trình thanh toán bằng biểu mẫu web cũ:
        window.location.href = "/legacy-web-form-checkout";
      });

    // Mỗi lần nhấp vào nút thanh toán phải dùng một thể hiện mới của
    // đối tượng PaymentRequest, vì PaymentRequest.show() chỉ có thể
    // được gọi một lần cho mỗi thể hiện.
    request = new PaymentRequest(
      buildSupportedPaymentMethodNames(),
      buildShoppingCartDetails(),
    );
  });
}
```

> [!NOTE]
> Xem [Feature detect support demo](https://mdn.github.io/dom-examples/payment-request/feature-detect-support.html) của chúng tôi để xem toàn bộ mã.

## Kiểm tra xem người dùng có thể thanh toán hay không

Việc kiểm tra xem người dùng có thể thanh toán hay không luôn hữu ích. Dưới đây là một vài kỹ thuật liên quan.

### Tùy biến nút thanh toán

Một kỹ thuật hữu ích là tùy biến nút payment request tùy theo việc người dùng có thể thanh toán hay không.

Trong đoạn mã sau, chúng ta làm đúng như vậy - tùy theo việc người dùng có thể thực hiện thanh toán nhanh hay cần thêm thông tin thanh toán trước, tiêu đề của nút thanh toán sẽ đổi giữa "Fast Checkout with W3C" và "Setup W3C Checkout". Trong cả hai trường hợp, nút thanh toán đều gọi {{domxref("PaymentRequest.show()")}}.

```js
const checkoutButton = document.getElementById("checkout-button");
checkoutButton.innerText = "Loading…";
if (window.PaymentRequest) {
  const request = new PaymentRequest(
    buildSupportedPaymentMethodNames(),
    buildShoppingCartDetails(),
  );
  request
    .canMakePayment()
    .then((canMakeAFastPayment) => {
      checkoutButton.textContent = canMakeAFastPayment
        ? "Fast Checkout with W3C"
        : "Setup W3C Checkout";
    })
    .catch((error) => {
      // Người dùng có thể đã tắt chức năng truy vấn trong cài đặt riêng tư.
      // Website không biết họ có thể thanh toán nhanh hay không, nên chọn
      // một tiêu đề chung.
      checkoutButton.textContent = "Checkout with W3C";
    });
}
```

> [!NOTE]
> Xem [Customizing the payment button demo](https://mdn.github.io/dom-examples/payment-request/customize-button-can-make-payment.html) để xem toàn bộ mã.

### Kiểm tra trước khi biết tất cả giá

Nếu luồng thanh toán cần biết liệu {{domxref("PaymentRequest.canMakePayment()")}} có trả về `true` ngay cả trước khi biết toàn bộ các mục và giá của chúng hay không, bạn có thể khởi tạo `PaymentRequest` bằng dữ liệu giả và truy vấn trước `.canMakePayment()`. Nếu gọi `.canMakePayment()` nhiều lần, hãy nhớ rằng tham số đầu tiên của hàm khởi tạo `PaymentRequest` nên chứa cùng tên phương thức và dữ liệu.

```js
// Trang đã tải xong. Trang có nên dùng PaymentRequest không?
// Nếu PaymentRequest thất bại, trang có nên quay về thanh toán thủ công
// bằng biểu mẫu web không?
const supportedPaymentMethods = [
  /* supported methods */
];

let shouldCallPaymentRequest = true;
let fallbackToLegacyOnPaymentRequestFailure = false;
new PaymentRequest(supportedPaymentMethods, {
  total: { label: "Stub", amount: { currency: "USD", value: "0.01" } },
})
  .canMakePayment()
  .then((result) => {
    shouldCallPaymentRequest = result;
  })
  .catch((error) => {
    console.error(error);

    // Người dùng có thể đã tắt khả năng truy vấn trong cài đặt riêng tư.
    // Hãy dùng PaymentRequest theo mặc định và quay về thanh toán dựa trên
    // biểu mẫu web cũ nếu cần.
    shouldCallPaymentRequest = true;
    fallbackToLegacyOnPaymentRequestFailure = true;
  });

// Người dùng đã nhấp vào nút thanh toán. Chúng ta biết
// trong giỏ hàng có gì, nhưng chưa có đối tượng `Checkout`.
function onCheckoutButtonClicked(lineItems) {
  callServerToRetrieveCheckoutDetails(lineItems);
}

// Máy chủ đã tạo đối tượng `Checkout`. Bây giờ chúng ta biết
// toàn bộ giá và các tùy chọn giao hàng.
function onServerCheckoutDetailsRetrieved(checkoutObject) {
  if (shouldCallPaymentRequest) {
    const request = new PaymentRequest(supportedPaymentMethods, checkoutObject);
    request
      .show()
      .then((paymentResponse) => {
        // Gửi kết quả lên máy chủ và gọi `paymentResponse.complete()`.
      })
      .catch((error) => {
        console.error(error);
        if (fallbackToLegacyOnPaymentRequestFailure) {
          window.location.href = "/legacy-web-form-checkout";
        } else {
          showCheckoutErrorToUser();
        }
      });
  } else {
    window.location.href = "/legacy-web-form-checkout";
  }
}
```

> [!NOTE]
> Xem [Checking user can make payments before prices are known demo](https://mdn.github.io/dom-examples/payment-request/check-user-can-make-payment.html) để xem toàn bộ mã.

## Đề xuất một ứng dụng thanh toán khi người dùng chưa có ứng dụng nào

Nếu bạn chọn thanh toán bằng nhà cung cấp demo BobBucks trên trang người bán này, nó sẽ cố gọi `PaymentRequest.show()`, đồng thời chặn {{domxref("DOMException")}} `NotSupportedError`. Nếu phương thức thanh toán này không được hỗ trợ, nó sẽ chuyển hướng tới trang đăng ký cho BobBucks.

Mã sẽ trông tương tự như sau:

```js
checkoutButton.addEventListener("click", () => {
  const request = new PaymentRequest(
    buildSupportedPaymentMethodData(),
    buildShoppingCartDetails(),
  );
  request
    .show()
    .then((paymentResponse) => {
      // Ở đây chúng ta sẽ xử lý thanh toán. Trong demo này, mô phỏng thành công ngay lập tức:
      paymentResponse.complete("success").then(() => {
        // Chỉ dùng cho mục đích demo:
        introPanel.style.display = "none";
        successPanel.style.display = "block";
      });
    })
    .catch((error) => {
      if (error.name === "NotSupportedError") {
        window.location.href = "https://bobbucks.dev/#download";
      } else {
        // Các loại lỗi khác; thanh toán bị hủy hoặc thất bại. Chỉ dùng cho mục đích demo:
        introPanel.style.display = "none";
        legacyPanel.style.display = "block";
      }
    });
});
```

> [!NOTE]
> Xem [Recommending a payment app when user has no apps demo](https://mdn.github.io/dom-examples/payment-request/recommend-payment-app.html) để xem toàn bộ mã.

## Hiển thị thêm giao diện sau khi thanh toán thành công

Nếu người bán muốn thu thập thêm thông tin không có trong API này, ví dụ hướng dẫn giao hàng bổ sung, họ có thể hiển thị một trang với thêm các trường `<input type="text">` sau khi thanh toán.

```js
request
  .show()
  .then((paymentResponse) => paymentResponse.complete("success"))
  .then(() => {
    // Xử lý thanh toán ở đây.
    // Đóng giao diện:
    // Yêu cầu thêm chi tiết địa chỉ giao hàng.
    const additionalDetailsContainer = document.getElementById(
      "additional-details-container",
    );
    additionalDetailsContainer.style.display = "block";
    window.scrollTo(additionalDetailsContainer.getBoundingClientRect().x, 0);
  })
  .catch((error) => {
    // Xử lý lỗi.
  });
```

> [!NOTE]
> Xem [Show additional user interface after successful payment demo](https://mdn.github.io/dom-examples/payment-request/show-additional-ui-after-payment.html) để xem toàn bộ mã.

## Ủy quyền trước giao dịch

Một số trường hợp sử dụng, ví dụ thanh toán nhiên liệu tại trạm dịch vụ, liên quan đến việc ủy quyền trước thanh toán. Một cách để làm điều này là thông qua một Web-based Payment Handler (xem {{domxref("Web-based Payment Handler API", "", "", "nocode")}}). Tại thời điểm viết bài này, đặc tả đó có một sự kiện `canmakepayment` mà Web-based Payment Handler có thể dùng để trả về trạng thái ủy quyền.

Mã phía người bán sẽ trông như sau:

```js
const paymentRequest = new PaymentRequest(
  [{ supportedMethods: "https://example.com/preauth" }],
  details,
);

// Gửi sự kiện `CanMakePayment` tới payment handler.
paymentRequest
  .canMakePayment()
  .then((res) => {
    if (res) {
      // Payment handler đã ủy quyền trước một giao dịch
      // với một số tiền tĩnh, ví dụ USD $1.00.
    } else {
      // Ủy quyền trước thất bại hoặc payment handler chưa được cài đặt.
    }
  })
  .catch((err) => {
    // Đã xảy ra lỗi không mong muốn.
  });
```

Web-based payment handler sẽ bao gồm đoạn mã sau:

```js
self.addEventListener("canmakepayment", (evt) => {
  // Ủy quyền trước tại đây.
  const preAuthSuccess = true;
  evt.respondWith(preAuthSuccess);
});
```

Payment handler này cần chạy trong một service worker ở phạm vi `https://example.com/preauth`.

> [!NOTE]
> Xem [Pre-authorizing transactions demo](https://mdn.github.io/dom-examples/payment-request/pre-authorize-transaction.html) để xem toàn bộ mã.

## Xem thêm

- [Google PaymentRequest Samples](https://googlechrome.github.io/samples/paymentrequest/)
