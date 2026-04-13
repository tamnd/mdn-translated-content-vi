---
title: CSSStyleSheet
slug: Web/API/CSSStyleSheet
page-type: web-api-interface
browser-compat: api.CSSStyleSheet
---

{{APIRef("CSSOM")}}

Giao diện **`CSSStyleSheet`** đại diện cho một [CSS](/en-US/docs/Web/CSS) bảng kiểu duy nhất, và cho phép bạn kiểm tra cũng như sửa đổi danh sách các quy tắc contained trong bảng kiểu. Nó kế thừa các thuộc tính và phương thức từ phần tử cha, {{domxref("StyleSheet")}}.

{{InheritanceDiagram}}

Một bảng kiểu bao gồm một tập hợp các đối tượng {{domxref("CSSRule")}} đại diện cho từng quy tắc trong bảng kiểu. Các quy tắc được chứa trong một {{domxref("CSSRuleList")}}, có thể được lấy từ thuộc tính {{domxref("CSSStyleSheet.cssRules", "cssRules")}} của bảng kiểu.

Ví dụ, một quy tắc có thể là một đối tượng {{domxref("CSSStyleRule")}} chứa một kiểu dáng như:

```css
h1,
h2 {
  font-size: 16pt;
}
```

Một quy tắc khác có thể là một _at-rule_ như {{cssxref("@import")}} hoặc {{cssxref("@media")}}, v.v.

Xem phần [Lấy một StyleSheet](#obtaining_a_stylesheet) để biết các cách khác nhau mà một đối tượng `CSSStyleSheet` có thể được lấy. Một đối tượng `CSSStyleSheet` cũng có thể được khởi tạo trực tiếp. Hàm khởi tạo, và các phương thức {{domxref("CSSStyleSheet.replace()")}}, {{domxref("CSSStyleSheet.replaceSync()")}} là các bổ sung mới hơn vào đặc tả, cho phép _Constructable Stylesheets_ (Bảng kiểu có thể khởi tạo).

Để áp dụng một `CSSStyleSheet` vào một tài liệu hoặc shadow root, gán nó cho thuộc tính {{domxref("Document.adoptedStyleSheets")}} hoặc {{domxref("ShadowRoot.adoptedStyleSheets")}} tương ứng.

## Constructor

- {{domxref("CSSStyleSheet.CSSStyleSheet()", "CSSStyleSheet()")}}
  - : Tạo một đối tượng `CSSStyleSheet` mới.

## Thuộc tính instance

_Kế thừa thuộc tính từ phần tử cha, {{domxref("StyleSheet")}}._

- {{domxref("CSSStyleSheet.cssRules")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("CSSRuleList")}} trực tiếp duy trì danh sách cập nhật các đối tượng {{domxref("CSSRule")}} cấu thành bảng kiểu.

    > [!NOTE]
    > Trong một số trình duyệt, nếu một bảng kiểu được tải từ một domain khác, việc truy cập `cssRules` sẽ dẫn đến `SecurityError`.

- {{domxref("CSSStyleSheet.ownerRule")}} {{ReadOnlyInline}}
  - : Nếu bảng kiểu này được nhập vào tài liệu bằng cách sử dụng một {{cssxref("@import")}} rule, thuộc tính `ownerRule` trả về {{domxref("CSSImportRule")}} tương ứng; nếu không, giá trị của thuộc tính này là `null`.

## Phương thức instance

_Kế thừa phương thức từ phần tử cha, {{domxref("StyleSheet")}}._

- {{domxref("CSSStyleSheet.deleteRule()")}}
  - : Xóa quy tắc tại vị trí chỉ định trong danh sách quy tắc của bảng kiểu.
- {{domxref("CSSStyleSheet.insertRule()")}}
  - : Chèn một quy tắc mới tại vị trí chỉ định trong bảng kiểu, dựa trên biểu diễn dạng văn bản của quy tắc.
- {{domxref("CSSStyleSheet.replace()")}}
  - : Thay thế bất đồng bộ nội dung của bảng kiểu và trả về một {{jsxref("Promise")}} giải quyết với `CSSStyleSheet` đã cập nhật.
- {{domxref("CSSStyleSheet.replaceSync()")}}
  - : Thay thế đồng bộ nội dung của bảng kiểu.

## Thuộc tính legacy

_Các thuộc tính này là thuộc tính legacy do Microsoft giới thiệu; được duy trì để tương thích với các trang web hiện có._

- {{domxref("CSSStyleSheet.rules", "rules")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Thuộc tính `rules` có chức năng tương tự như thuộc tính {{domxref("CSSStyleSheet.cssRules", "cssRules")}} tiêu chuẩn; nó trả về một {{domxref("CSSRuleList")}} trực tiếp duy trì danh sách cập nhật của tất cả các quy tắc trong bảng kiểu.

## Phương thức legacy

_Các phương thức này là phương thức legacy do Microsoft giới thiệu; được duy trì để tương thích với các trang web hiện có._

- {{domxref("CSSStyleSheet.addRule", "addRule()")}} {{Deprecated_Inline}}
  - : Thêm một quy tắc mới vào bảng kiểu dựa trên bộ chọn áp dụng cho quy tắc đó và khối kiểu dáng áp dụng cho các phần tử khớp.

    Điều này khác với {{domxref("CSSStyleSheet.insertRule", "insertRule()")}}, phương thức nhận biểu diễn dạng văn bản của toàn bộ quy tắc dưới dạng một chuỗi duy nhất.

- {{domxref("CSSStyleSheet.removeRule", "removeRule()")}} {{Deprecated_Inline}}
  - : Có chức năng tương tự như {{domxref("CSSStyleSheet.deleteRule", "deleteRule()")}}; xóa quy tắc tại vị trí chỉ định khỏi danh sách quy tắc của bảng kiểu.

## Lấy một StyleSheet

Một bảng kiểu được liên kết với tối đa một {{domxref("Document")}}, mà nó áp dụng cho (trừ khi {{domxref("StyleSheet.disabled", "disabled", "", 1)}}). Có thể lấy danh sách các đối tượng `CSSStyleSheet` cho một tài liệu nhất định bằng cách sử dụng thuộc tính {{domxref("Document.styleSheets")}}. Một bảng kiểu cụ thể cũng có thể được truy cập từ đối tượng _chủ sở hữu_ (`Node` hoặc `CSSImportRule`), nếu có.

Một đối tượng `CSSStyleSheet` được tạo và chèn tự động vào danh sách {{domxref("Document.styleSheets")}} của tài liệu bởi trình duyệt, khi một bảng kiểu được tải cho một tài liệu.

Danh sách (có thể chưa đầy đủ) các cách một bảng kiểu có thể được liên kết với một tài liệu như sau:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">
        Lý do bảng kiểu được liên kết với tài liệu
      </th>
      <th scope="col">
        Xuất hiện trong danh sách <code>document.<br />styleSheets</code>
      </th>
      <th scope="col">
        Lấy phần tử/quy tắc chủ sở hữu từ đối tượng bảng kiểu
      </th>
      <th scope="col">Giao diện cho đối tượng chủ sở hữu</th>
      <th scope="col">Lấy đối tượng CSSStyleSheet từ chủ sở hữu</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        Các phần tử {{HTMLElement("style")}} và {{HTMLElement("link")}} trong tài liệu
      </td>
      <td>Có</td>
      <td>{{domxref("StyleSheet.ownerNode", ".ownerNode")}}</td>
      <td>
        {{domxref("HTMLLinkElement")}},<br />{{domxref("HTMLStyleElement")}},<br />hoặc
        {{domxref("SVGStyleElement")}}
      </td>
      <td>
        {{domxref("HTMLLinkElement.sheet")}},<br />{{domxref("HTMLStyleElement.sheet")}},<br />hoặc
        {{domxref("SVGStyleElement.sheet")}}
      </td>
    </tr>
    <tr>
      <td>
        Quy tắc CSS {{cssxref("@import")}} trong các bảng kiểu khác áp dụng cho
        tài liệu
      </td>
      <td>Có</td>
      <td>
        {{domxref("CSSStyleSheet.ownerRule", ".ownerRule")}}
      </td>
      <td>{{domxref("CSSImportRule")}}</td>
      <td>
        {{domxref("CSSImportRule.styleSheet", ".styleSheet")}}
      </td>
    </tr>
    <tr>
      <td>
        Chỉ thị xử lý <code>&#x3C;?xml-stylesheet ?></code> trong tài liệu
        (không phải HTML)
      </td>
      <td>Có</td>
      <td>{{domxref("StyleSheet.ownerNode", ".ownerNode")}}</td>
      <td>{{domxref("ProcessingInstruction")}}</td>
      <td>
        {{domxref("ProcessingInstruction.sheet", ".sheet")}}
      </td>
    </tr>
    <tr>
      <td>
        JavaScript <a href="/en-US/docs/Web/JavaScript/Reference/Statements/import/with"><code>import ... with { type: "css" }</code></a>
      </td>
      <td>Không</td>
      <td>Không áp dụng</td>
      <td>Không áp dụng</td>
      <td>Không áp dụng</td>
    </tr>
    <tr>
      <td>HTTP Link Header</td>
      <td>Có</td>
      <td><em>Không áp dụng</em></td>
      <td>Không áp dụng</td>
      <td>Không áp dụng</td>
    </tr>
    <tr>
      <td>Bảng kiểu mặc định của user agent</td>
      <td>Không</td>
      <td>Không áp dụng</td>
      <td>Không áp dụng</td>
      <td>Không áp dụng</td>
    </tr>
  </tbody>
</table>

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
