---
title: XPathResult
slug: Web/API/XPathResult
page-type: web-api-interface
browser-compat: api.XPathResult
---

{{APIRef("DOM")}}

Giao diện **`XPathResult`** đại diện cho các kết quả được tạo ra khi đánh giá một biểu thức XPath trong bối cảnh của một nút đã cho.

Vì các biểu thức XPath có thể tạo ra nhiều kiểu kết quả khác nhau, giao diện này giúp xác định và xử lý kiểu và giá trị của kết quả.

## Thuộc tính phiên bản

- {{domxref("XPathResult.booleanValue")}} {{ReadOnlyInline}}
  - : Một giá trị `boolean` đại diện cho giá trị của kết quả nếu `resultType` là `BOOLEAN_TYPE`.
- {{domxref("XPathResult.invalidIteratorState")}} {{ReadOnlyInline}}
  - : Cho biết iterator đã trở nên không hợp lệ. Là `true` nếu `resultType` là `UNORDERED_NODE_ITERATOR_TYPE` hoặc `ORDERED_NODE_ITERATOR_TYPE` và tài liệu đã bị sửa đổi kể từ khi kết quả này được trả về.
- {{domxref("XPathResult.numberValue")}} {{ReadOnlyInline}}
  - : Một `number` đại diện cho giá trị của kết quả nếu `resultType` là `NUMBER_TYPE`.
- {{domxref("XPathResult.resultType")}} {{ReadOnlyInline}}
  - : Một mã `number` đại diện cho kiểu của kết quả, được định nghĩa bởi các hằng số kiểu.
- {{domxref("XPathResult.singleNodeValue")}} {{ReadOnlyInline}}
  - : Một {{domxref("Node")}} đại diện cho giá trị của kết quả nút đơn, có thể là `null`.
- {{domxref("XPathResult.snapshotLength")}} {{ReadOnlyInline}}
  - : Số lượng nút trong ảnh chụp kết quả.
- {{domxref("XPathResult.stringValue")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho giá trị của kết quả nếu `resultType` là `STRING_TYPE`.

## Phương thức phiên bản

- {{domxref("XPathResult.iterateNext()")}}
  - : Nếu kết quả là một tập hợp nút, phương thức này lặp qua nó và trả về nút tiếp theo từ nó hoặc `null` nếu không còn nút nào.
- {{domxref("XPathResult.snapshotItem()")}}
  - : Trả về một phần tử của tập hợp ảnh chụp hoặc `null` trong trường hợp chỉ số nằm ngoài phạm vi của các nút. Không giống như kết quả iterator, ảnh chụp không trở nên không hợp lệ, nhưng có thể không tương ứng với tài liệu hiện tại nếu nó bị thay đổi.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.evaluate()")}}
- {{domxref("XPathExpression")}}
