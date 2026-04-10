---
title: "XMLHttpRequest: phương thức setPrivateToken()"
short-title: setPrivateToken()
slug: Web/API/XMLHttpRequest/setPrivateToken
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XMLHttpRequest.setPrivateToken
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}{{SeeCompatTable}}

Phương thức {{domxref("XMLHttpRequest")}} **`setPrivateToken()`** thêm thông tin [private state token](/en-US/docs/Web/API/Private_State_Token_API/Using) vào một lệnh gọi `XMLHttpRequest`, để bắt đầu các hoạt động private state token.

## Cú pháp

```js-nolint
setPrivateToken(privateToken)
```

### Tham số

- `privateToken`
  - : Một đối tượng chứa các tùy chọn để bắt đầu hoạt động private state token. Các thuộc tính có thể bao gồm:
    - `issuers` {{optional_inline}}
      - : Một mảng chuỗi chứa các URL của nhà phát hành mà bạn muốn chuyển tiếp bản ghi đổi thưởng. Cài đặt này bị bỏ qua trừ khi `operation` được đặt thành `send-redemption-record`, trong trường hợp đó mảng `issuers` phải được bao gồm.
    - `operation`
      - : Một chuỗi đại diện cho loại hoạt động token bạn muốn bắt đầu. Các giá trị có thể là:
        - `token-request`
          - : Bắt đầu hoạt động [yêu cầu token](/en-US/docs/Web/API/Private_State_Token_API/Using#issuing_a_token_via_your_server).
        - `token-redemption`
          - : Bắt đầu hoạt động [đổi thưởng token](/en-US/docs/Web/API/Private_State_Token_API/Using#redeeming_a_token_via_your_server).
        - `send-redemption-record`
          - : Bắt đầu hoạt động [gửi bản ghi đổi thưởng](/en-US/docs/Web/API/Private_State_Token_API/Using#redemption_record_usage_2).
    - `refreshPolicy` {{optional_inline}}
      - : Một giá trị được liệt kê chỉ định hành vi mong đợi khi một bản ghi đổi thưởng chưa hết hạn cho người dùng và trang web hiện tại đã được đặt trước đó. Cài đặt này bị bỏ qua trừ khi `operation` được đặt thành `token-redemption`. Các giá trị có thể là:
        - `none`
          - : Bản ghi đổi thưởng đã đặt trước đó sẽ được sử dụng, và một bản ghi mới không nên được phát hành. Đây là giá trị mặc định.
        - `refresh`
          - : Một bản ghi đổi thưởng mới luôn được phát hành.
    - `version`
      - : Một số chỉ định phiên bản của giao thức mật mã bạn muốn sử dụng khi tạo token. Hiện tại giá trị này luôn được đặt thành `1`, là phiên bản duy nhất mà đặc tả hỗ trợ. Khi chỉ định tùy chọn `privateToken`, thuộc tính này là bắt buộc.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu `XMLHttpRequest` liên kết không ở trạng thái đã mở, hoặc {{domxref("XMLHttpRequest.send", "send()")}} đã được gọi trên nó.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu việc sử dụng các hoạt động [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) bị cấm cụ thể bởi {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} hoặc {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- {{jsxref("TypeError")}}
  - : Được ném nếu `operation` được đặt thành `send-redemption-record`, và mảng `issues` rỗng hoặc không được đặt, hoặc một hoặc nhiều `issuers` được chỉ định không phải là URL HTTPS đáng tin cậy.

## Ví dụ

### Phát hành một private token

```js
const hasToken = await Document.hasPrivateToken(`issuer.example`);
if (!hasToken) {
  const request = new XMLHttpRequest();
  request.open(
    "POST",
    "https://issuer.example/.well-known/private-state-token/issuance",
  );
  request.setPrivateToken({
    version: 1,
    operation: "token-request",
  });
  req.send();
}
```

### Đổi thưởng một private token

```js
const request = new XMLHttpRequest();
request.open(
  "POST",
  "https://issuer.example/.well-known/private-state-token/redemption",
);
request.setPrivateToken({
  version: 1,
  operation: "token-redemption",
  refreshPolicy: "none",
});
req.send();
```

### Chuyển tiếp một bản ghi đổi thưởng

```js
const hasRR = await Document.hasRedemptionRecord(`issuer.example`);
if (hasRR) {
  const request = new XMLHttpRequest();
  request.open("POST", "some-resource.example");
  request.setPrivateToken({
    version: 1,
    operation: "send-redemption-record",
    issuers: ["https://issuer.example"],
  });
  req.send();
}
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
