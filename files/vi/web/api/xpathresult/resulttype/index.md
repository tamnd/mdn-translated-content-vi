---
title: "XPathResult: resultType property"
short-title: resultType
slug: Web/API/XPathResult/resultType
page-type: web-api-instance-property
browser-compat: api.XPathResult.resultType
---

{{APIRef("DOM")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`resultType`** của giao diện
{{domxref("XPathResult")}} đại diện cho kiểu của kết quả, được định nghĩa bởi
các hằng số kiểu.

## Giá trị

Một giá trị số nguyên đại diện cho kiểu của kết quả, được định nghĩa bởi các hằng số kiểu.

## Hằng số

<table class="no-markdown">
  <thead>
    <tr>
      <th>Hằng số kiểu kết quả được định nghĩa</th>
      <th>Giá trị</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>ANY_TYPE</code></td>
      <td><code>0</code></td>
      <td>
        Một tập hợp kết quả chứa bất kỳ kiểu nào tự nhiên phát sinh từ việc đánh giá
        biểu thức. Lưu ý rằng nếu kết quả là tập hợp nút thì
        <code>UNORDERED_NODE_ITERATOR_TYPE</code> luôn là kiểu kết quả.
      </td>
    </tr>
    <tr>
      <td><code>NUMBER_TYPE</code></td>
      <td><code>1</code></td>
      <td>
        Một kết quả chứa một số đơn. Điều này hữu ích, ví dụ trong một
        biểu thức XPath sử dụng hàm <code>count()</code>.
      </td>
    </tr>
    <tr>
      <td><code>STRING_TYPE</code></td>
      <td><code>2</code></td>
      <td>Một kết quả chứa một chuỗi đơn.</td>
    </tr>
    <tr>
      <td><code>BOOLEAN_TYPE</code></td>
      <td><code>3</code></td>
      <td>
        Một kết quả chứa một giá trị boolean đơn. Điều này hữu ích, ví dụ
        trong một biểu thức XPath sử dụng hàm <code>not()</code>.
      </td>
    </tr>
    <tr>
      <td><code>UNORDERED_NODE_ITERATOR_TYPE</code></td>
      <td><code>4</code></td>
      <td>
        Một tập hợp nút kết quả chứa tất cả các nút khớp với biểu thức. Các
        nút không nhất thiết phải theo cùng thứ tự mà chúng xuất hiện trong
        tài liệu.
      </td>
    </tr>
    <tr>
      <td><code>ORDERED_NODE_ITERATOR_TYPE</code></td>
      <td><code>5</code></td>
      <td>
        Một tập hợp nút kết quả chứa tất cả các nút khớp với biểu thức. Các
        nút trong tập hợp kết quả theo cùng thứ tự mà chúng xuất hiện trong
        tài liệu.
      </td>
    </tr>
    <tr>
      <td><code>UNORDERED_NODE_SNAPSHOT_TYPE</code></td>
      <td><code>6</code></td>
      <td>
        Một tập hợp nút kết quả chứa các ảnh chụp của tất cả các nút khớp với
        biểu thức. Các nút không nhất thiết phải theo cùng thứ tự mà chúng xuất hiện
        trong tài liệu.
      </td>
    </tr>
    <tr>
      <td><code>ORDERED_NODE_SNAPSHOT_TYPE</code></td>
      <td><code>7</code></td>
      <td>
        Một tập hợp nút kết quả chứa các ảnh chụp của tất cả các nút khớp với
        biểu thức. Các nút trong tập hợp kết quả theo cùng thứ tự mà chúng xuất hiện
        trong tài liệu.
      </td>
    </tr>
    <tr>
      <td><code>ANY_UNORDERED_NODE_TYPE</code></td>
      <td><code>8</code></td>
      <td>
        Một tập hợp nút kết quả chứa bất kỳ nút đơn nào khớp với biểu thức.
        Nút không nhất thiết là nút đầu tiên trong tài liệu khớp với biểu thức.
      </td>
    </tr>
    <tr>
      <td><code>FIRST_ORDERED_NODE_TYPE</code></td>
      <td><code>9</code></td>
      <td>
        Một tập hợp nút kết quả chứa nút đầu tiên trong tài liệu khớp với
        biểu thức.
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `resultType`.

### HTML

```html
<div>XPath example</div>
<div>Is XPath result a node set: <output></output></div>
```

### JavaScript

```js
const xpath = "//div";
const result = document.evaluate(
  xpath,
  document,
  null,
  XPathResult.ANY_TYPE,
  null,
);
document.querySelector("output").textContent =
  result.resultType >= XPathResult.UNORDERED_NODE_ITERATOR_TYPE &&
  result.resultType <= XPathResult.FIRST_ORDERED_NODE_TYPE;
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
