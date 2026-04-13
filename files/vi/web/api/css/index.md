---
title: CSS
slug: Web/API/CSS
page-type: web-api-interface
browser-compat: api.CSS
---

{{APIRef("CSSOM")}}

Giao diện **`CSS`** chứa các phương thức hữu ích liên quan đến CSS. Không có đối tượng nào triển khai giao diện này: nó chỉ bao gồm các phương thức tĩnh và vì vậy là một giao diện tiện ích.

## Thuộc tính tĩnh

- {{DOMxRef("CSS/highlights_static", "CSS.highlights")}}
  - : Cung cấp quyền truy cập vào `HighlightRegistry` dùng để tạo kiểu cho các phạm vi văn bản tùy ý bằng {{domxref("css_custom_highlight_api", "CSS Custom Highlight API", "", "nocode")}}.
- {{DOMxRef("CSS/paintWorklet_static", "CSS.paintWorklet")}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Cung cấp quyền truy cập vào Worklet chịu trách nhiệm cho mọi lớp liên quan đến việc vẽ.

## Thuộc tính thể hiện

_Giao diện CSS là một giao diện tiện ích và không thể tạo đối tượng thuộc kiểu này: chỉ các thuộc tính tĩnh được định nghĩa trên nó._

## Phương thức tĩnh

_Không có phương thức tĩnh kế thừa._

- {{DOMxRef("CSS/registerProperty_static", "CSS.registerProperty()")}}
  - : Đăng ký [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*), cho phép kiểm tra kiểu thuộc tính, giá trị mặc định, và các thuộc tính có hoặc không kế thừa giá trị của chúng.
- {{DOMxRef("CSS/supports_static", "CSS.supports()")}}
  - : Trả về giá trị boolean cho biết cặp _thuộc tính-giá trị_, hoặc điều kiện, được truyền vào tham số có được hỗ trợ hay không.
- {{DOMxRef("CSS/escape_static", "CSS.escape()")}}
  - : Có thể được dùng để escape một chuỗi, chủ yếu để dùng như một phần của bộ chọn CSS.
- [Các hàm factory của CSS](/en-US/docs/Web/API/CSS/factory_functions_static)
  - : Có thể được dùng để trả về một [`CSSUnitValue`](/en-US/docs/Web/API/CSSUnitValue) mới với giá trị là số ở tham số và đơn vị là tên của phương thức factory đã dùng.

    ```js
    CSS.em(3); // CSSUnitValue {value: 3, unit: "em"}
    ```

## Phương thức thể hiện

_Giao diện CSS là một giao diện tiện ích và không thể tạo đối tượng thuộc kiểu này: chỉ các phương thức tĩnh được định nghĩa trên nó._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
