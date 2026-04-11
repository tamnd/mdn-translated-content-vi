---
title: PaymentAddress
slug: Web/API/PaymentAddress
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.PaymentAddress
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`PaymentAddress`** của [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) được sử dụng để lưu trữ thông tin địa chỉ giao hàng hoặc thanh toán.

Có thể hữu ích khi tham khảo tài liệu [Addressing S42 standard](https://www.upu.int/en/Postal-Solutions/Programmes-Services/Addressing-Solutions#addressing-s42-standard) trên trang web của Liên minh Bưu chính Toàn cầu, cung cấp thông tin về các tiêu chuẩn quốc tế cho địa chỉ bưu chính.

## Thuộc tính phiên bản

- {{domxref('PaymentAddress.addressLine')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một mảng các chuỗi cung cấp từng dòng của địa chỉ không được bao gồm trong các thuộc tính khác. Kích thước và nội dung chính xác thay đổi theo quốc gia hoặc địa điểm và có thể bao gồm, ví dụ, tên đường, số nhà, số căn hộ, tuyến giao hàng nông thôn, hướng dẫn mô tả, hoặc số hộp thư bưu điện.
- {{domxref('PaymentAddress.country')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi chỉ định quốc gia nơi địa chỉ tọa lạc, sử dụng tiêu chuẩn [ISO-3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Chuỗi luôn được đưa ra ở dạng chữ hoa chuẩn. Một số ví dụ về giá trị `country` hợp lệ: `"US"`, `"GB"`, `"CN"`, hoặc `"JP"`.
- {{domxref('PaymentAddress.city')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi chứa phần thành phố hoặc thị trấn của địa chỉ.
- {{domxref('PaymentAddress.dependentLocality')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi cho biết địa phương phụ thuộc hoặc địa phương con trong một thành phố, ví dụ, khu phố, quận, huyện, hoặc địa phương phụ thuộc của Vương quốc Anh.
- {{domxref('PaymentAddress.organization')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi chỉ định tên của tổ chức, công ty, hoặc tổ chức tại địa chỉ thanh toán.
- {{domxref('PaymentAddress.phone')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi chỉ định số điện thoại của người nhận hoặc người liên hệ.
- {{domxref('PaymentAddress.postalCode')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi chỉ định mã được sử dụng bởi một khu vực pháp lý để định tuyến thư, ví dụ, mã ZIP ở Hoa Kỳ hoặc mã PIN ở Ấn Độ.
- {{domxref('PaymentAddress.recipient')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi cho biết tên của người nhận, người mua, hoặc người liên hệ tại địa chỉ thanh toán.
- {{domxref('PaymentAddress.region')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi chứa phân khu hành chính cấp cao nhất của quốc gia, ví dụ bang, tỉnh, oblast, hoặc tỉnh.
- {{domxref('PaymentAddress.sortingCode')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một chuỗi cung cấp mã phân loại bưu chính như được sử dụng ở Pháp.

> [!NOTE]
> Các thuộc tính không có giá trị được chỉ định chứa các chuỗi rỗng.

## Phương thức phiên bản

- {{domxref('PaymentAddress.toJSON()')}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một serializer tiêu chuẩn trả về biểu diễn JSON của các thuộc tính đối tượng `PaymentAddress`.

## Ví dụ

Trong ví dụ sau, hàm khởi tạo {{domxref("PaymentRequest.PaymentRequest","PaymentRequest()")}} được sử dụng để tạo một yêu cầu thanh toán mới, nhận ba đối tượng làm tham số - một chứa chi tiết về các phương thức thanh toán có thể được sử dụng, một chứa chi tiết về đơn hàng thực tế (chẳng hạn như các mặt hàng đã mua và tùy chọn giao hàng), và một đối tượng tùy chọn chứa các tùy chọn bổ sung.

Đối tượng đầu tiên trong số ba đối tượng này (`supportedInstruments` trong ví dụ bên dưới) chứa thuộc tính `data` phải tuân theo cấu trúc được xác định bởi phương thức thanh toán.

```js
const supportedInstruments = [
  {
    supportedMethods: "https://example.com/pay",
  },
];

const details = {
  total: { label: "Donation", amount: { currency: "USD", value: "65.00" } },
  displayItems: [
    {
      label: "Original donation amount",
      amount: { currency: "USD", value: "65.00" },
    },
  ],
  shippingOptions: [
    {
      id: "standard",
      label: "Standard shipping",
      amount: { currency: "USD", value: "0.00" },
      selected: true,
    },
  ],
};

const options = { requestShipping: true };

async function doPaymentRequest() {
  const request = new PaymentRequest(supportedInstruments, details, options);
  // Add event listeners here.
  // Call show() to trigger the browser's payment flow.
  const response = await request.show();
  // Process payment.
  const json = response.toJSON();
  const httpResponse = await fetch("/pay/", { method: "POST", body: json });
  const result = httpResponse.ok ? "success" : "failure";

  await response.complete(result);
}
doPaymentRequest();
```

Sau khi luồng thanh toán được kích hoạt bằng {{domxref("PaymentRequest.show()")}} và promise phân giải thành công, đối tượng {{domxref("PaymentResponse")}} có sẵn từ promise được thực hiện (`instrumentResponse` ở trên) sẽ có thuộc tính {{domxref("PaymentResponse.details")}} chứa chi tiết phản hồi. Thuộc tính này phải tuân theo cấu trúc được xác định bởi nhà cung cấp phương thức thanh toán.

## Tương thích trình duyệt

{{Compat}}
