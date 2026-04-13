---
title: TrustedTypePolicyFactory
slug: Web/API/TrustedTypePolicyFactory
page-type: web-api-interface
browser-compat: api.TrustedTypePolicyFactory
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Giao diện **`TrustedTypePolicyFactory`** của {{domxref("Trusted Types API", "", "", "nocode")}} tạo các chính sách và cho phép xác minh các đối tượng Trusted Type so với các chính sách đã tạo.

## Thuộc tính phiên bản

- {{domxref("TrustedTypePolicyFactory.emptyHTML")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("TrustedHTML")}} chứa chuỗi rỗng.
- {{domxref("TrustedTypePolicyFactory.emptyScript")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("TrustedScript")}} chứa chuỗi rỗng.
- {{domxref("TrustedTypePolicyFactory.defaultPolicy")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("TrustedTypePolicy")}} mặc định hoặc null nếu chưa được đặt.

## Phương thức phiên bản

- {{domxref("TrustedTypePolicyFactory.createPolicy()")}}
  - : Tạo một đối tượng {{domxref("TrustedTypePolicy")}} triển khai các quy tắc được truyền vào dưới dạng `policyOptions`.
- {{domxref("TrustedTypePolicyFactory.isHTML()")}}
  - : Khi được truyền một giá trị, kiểm tra xem đó có phải là đối tượng {{domxref("TrustedHTML")}} hợp lệ hay không.
- {{domxref("TrustedTypePolicyFactory.isScript()")}}
  - : Khi được truyền một giá trị, kiểm tra xem đó có phải là đối tượng {{domxref("TrustedScript")}} hợp lệ hay không.
- {{domxref("TrustedTypePolicyFactory.isScriptURL()")}}
  - : Khi được truyền một giá trị, kiểm tra xem đó có phải là đối tượng {{domxref("TrustedScriptURL")}} hợp lệ hay không.
- {{domxref("TrustedTypePolicyFactory.getAttributeType()")}}
  - : Cho phép các nhà phát triển web kiểm tra xem có yêu cầu Trusted Type cho một phần tử và thuộc tính không, và nếu có thì là loại nào.
- {{domxref("TrustedTypePolicyFactory.getPropertyType()")}}
  - : Cho phép các nhà phát triển web kiểm tra xem có yêu cầu Trusted Type cho một thuộc tính không, và nếu có thì là loại nào.

## Ví dụ

Đoạn mã dưới đây tạo một chính sách với tên `"myEscapePolicy"` với hàm được định nghĩa cho `createHTML()` để làm sạch HTML.

Sau đó chúng ta sử dụng chính sách để làm sạch một chuỗi, tạo ra đối tượng {{domxref("TrustedHTML")}}, `escaped`. Đối tượng này có thể được kiểm tra bằng {{domxref("TrustedTypePolicyFactory.isHTML","isHTML()")}} để đảm bảo nó được tạo bởi một trong các chính sách của chúng ta.

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) => string.replace(/</g, "&lt;"),
});

const escaped = escapeHTMLPolicy.createHTML("<img src=x onerror=alert(1)>");

console.log(trustedTypes.isHTML(escaped)); // true;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
