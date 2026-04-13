---
title: "Range: phương thức createContextualFragment()"
short-title: createContextualFragment()
slug: Web/API/Range/createContextualFragment
page-type: web-api-instance-method
browser-compat: api.Range.createContextualFragment
---

{{APIRef("DOM")}}

> [!WARNING]
> Phương thức này phân tích đầu vào của nó dưới dạng HTML hoặc XML, rồi ghi kết quả vào một {{domxref("DocumentFragment")}} có thể sau đó được chèn vào DOM.
> Các API như thế này được xem là [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là nguồn cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm rủi ro bằng cách gán các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [ép buộc trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).
> Điều này bảo đảm đầu vào đi qua một hàm chuyển đổi, nhờ đó có cơ hội [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) nội dung để loại bỏ đánh dấu có thể nguy hiểm.

Phương thức **`Range.createContextualFragment()`** của giao diện {{domxref("Range")}} trả về một {{domxref("DocumentFragment")}} biểu diễn đầu vào HTML hoặc XML đã được phân tích.

## Cú pháp

```js-nolint
createContextualFragment(input)
```

### Tham số

- `input`
  - : Một thể hiện {{domxref("TrustedHTML")}} hoặc chuỗi biểu diễn văn bản và thẻ sẽ được chuyển thành document fragment.

### Giá trị trả về

Một đối tượng {{domxref("DocumentFragment")}}.

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu thuộc tính được đặt bằng chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) đang được [CSP ép buộc](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có default policy nào được định nghĩa.

## Mô tả

Phương thức **`Range.createContextualFragment()`** trả về một {{domxref("DocumentFragment")}} bằng cách gọi thuật toán phân tích fragment HTML hoặc XML với đầu của range làm context node.

Thuật toán phân tích fragment HTML được dùng nếu range thuộc về một `Document` có HTMLness bit được bật.
Trong trường hợp HTML, nếu context node sẽ là `html`, vì lý do lịch sử, thuật toán phân tích fragment sẽ được gọi với `body` làm context thay thế.

### Cân nhắc bảo mật

Phương thức này không thực hiện bất kỳ bước sanitize nào để loại bỏ các phần tử không an toàn với XSS.
Nếu đầu vào do người dùng cung cấp, và {{domxref("DocumentFragment")}} được trả về sau đó được chèn vào DOM, phương thức này có thể trở thành nguồn tấn công XSS.

## Ví dụ

### Dùng `createContextualFragment()` với `TrustedHTML`

Trusted types chưa được tất cả trình duyệt hỗ trợ, nên trước hết chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta định nghĩa một policy tên `some-content-policy` để tạo các đối tượng {{domxref("TrustedHTML")}} từ đầu vào.

```js
const policy = trustedTypes.createPolicy("some-content-policy", {
  createHTML(input) {
    return input; // Đừng làm vậy trong mã của riêng bạn!
  },
});

const unsafeText = "<script>alert('Potentially evil code!');</script>";
const trustedHTML = policy.createHTML(unsafeText);
```

Chúng ta có thể tạo một `DocumentFragment` bằng phiên bản đã tin cậy của văn bản gốc, rồi an toàn thêm nó vào tài liệu:

```js
const range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
const documentFragment = range.createContextualFragment(trustedHTML);
document.body.appendChild(documentFragment);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
