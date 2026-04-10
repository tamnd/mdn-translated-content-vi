---
title: "HTMLTableCellElement: thuộc tính scope"
short-title: scope
slug: Web/API/HTMLTableCellElement/scope
page-type: web-api-instance-property
browser-compat: api.HTMLTableCellElement.scope
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`scope`** của giao diện {{domxref("HTMLTableCellElement")}}
cho biết phạm vi của một ô {{HTMLElement("th")}}.

Các ô tiêu đề có thể được cấu hình, sử dụng thuộc tính `scope`, để áp dụng cho một hàng hoặc cột được chỉ định, hoặc cho các ô chưa được xác định phạm vi trong nhóm hàng hiện tại (tức là, cùng phần tử tổ tiên {{HTMLElement("thead")}}, {{HTMLElement("tbody")}}, hoặc {{HTMLElement("tfoot")}}). Nếu không có giá trị nào được chỉ định cho `scope`, tiêu đề không được liên kết trực tiếp với các ô theo cách này. Các giá trị được phép cho `scope` là:

> [!NOTE]
> Thuộc tính này không có hiệu ứng trực quan trong trình duyệt. Nó thêm thông tin ngữ nghĩa để hỗ trợ công nghệ hỗ trợ như trình đọc màn trình bày bảng một cách mạch lạc hơn.

## Giá trị

Một trong các giá trị sau:

- `col`
  - : Ô tiêu đề áp dụng cho các ô tiếp theo trong cùng một cột (hoặc các cột, nếu sử dụng `colspan`), cho đến khi hết cột hoặc một `<th>` khác trong cột thiết lập một phạm vi mới.
- `colgroup`
  - : Ô tiêu đề áp dụng cho tất cả các ô trong nhóm cột hiện tại chưa có phạm vi được áp dụng. Giá trị này chỉ được phép nếu ô nằm trong một nhóm cột.
- `row`
  - : Ô tiêu đề áp dụng cho các ô tiếp theo trong cùng một hàng (hoặc các hàng, nếu sử dụng `rowspan`), cho đến khi hết hàng hoặc một `<th>` khác trong cùng hàng thiết lập một phạm vi mới.
- `rowgroup`
  - : Ô tiêu đề áp dụng cho tất cả các ô trong nhóm hàng hiện tại chưa có phạm vi được áp dụng. Giá trị này chỉ được phép nếu ô nằm trong một nhóm hàng.
- Chuỗi rỗng (`""`)
  - : Ô tiêu đề không có phạm vi xác định trước; tác nhân người dùng sẽ thiết lập phạm vi dựa trên các manh mối ngữ cảnh.

## Ví dụ

Ví dụ này thêm nhãn scope cho tất cả các số `th` của `thead`.

### HTML

```html
<table>
  <caption>
    Tallest Dams
  </caption>
  <thead>
    <tr>
      <td></td>
      <th>Dam</th>
      <th>Country</th>
      <th>Height</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1.</td>
      <th scope="row">Jinping-I Dam</th>
      <td>China</td>
      <td>305 m</td>
    </tr>
    <tr>
      <td>2.</td>
      <th scope="row">Nurek Dam</th>
      <td>Tajikistan</td>
      <td>300 m</td>
    </tr>
    <tr>
      <td>3.</td>
      <th scope="row">Lianghekou Dam</th>
      <td>China</td>
      <td>295 m</td>
    </tr>
    <tr>
      <td>4.</td>
      <th scope="row">Xiowan Dam</th>
      <td>China</td>
      <td>292 m</td>
    </tr>
    <tr>
      <td>5.</td>
      <th scope="row">Balhetan Dam</th>
      <td>China</td>
      <td>289 m</td>
    </tr>
    <tr>
      <td>6.</td>
      <th scope="row">Xiluodu Dam</th>
      <td>China</td>
      <td>285.5 m</td>
    </tr>
    <tr>
      <td>7.</td>
      <th scope="row">Grande-Dixence Dam</th>
      <td>Switzerland</td>
      <td>285 m</td>
    </tr>
  </tbody>
</table>
```

### JavaScript

```js
const thElements = document.querySelectorAll("thead th");
thElements.forEach((th) => {
  th.scope = "col";
});
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 220)}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
