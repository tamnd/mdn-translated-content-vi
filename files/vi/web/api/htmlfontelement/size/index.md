---
title: "HTMLFontElement: thuộc tính size"
short-title: size
slug: Web/API/HTMLFontElement/size
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLFontElement.size
---

{{deprecated_header}}{{ APIRef("HTML DOM") }}

Thuộc tính đã lỗi thời **`HTMLFontElement.size`** là một chuỗi phản ánh thuộc tính HTML [`size`](/en-US/docs/Web/HTML/Reference/Elements/font#size). Nó chứa kích thước font chữ từ 1 đến 7 hoặc một số tương đối so với giá trị mặc định 3, ví dụ -2 hoặc +1.

Định dạng của chuỗi phải tuân theo một trong các microsyntax HTML sau:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Microsyntax</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Chuỗi số kích thước hợp lệ</td>
      <td><em>số nguyên trong khoảng 1-7</em></td>
      <td><code>6</code></td>
    </tr>
    <tr>
      <td>Chuỗi kích thước tương đối</td>
      <td>
        <em>+x hoặc -x, trong đó x là số tương đối so với 3 (kết quả phải nằm trong khoảng 1-7)</em>
      </td>
      <td>
        <code>+2<br />-1</code>
      </td>
    </tr>
  </tbody>
</table>

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử có phần tử <font id="f"> trong HTML

const f = document.getElementById("f");
f.size = "6";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLFontElement")}} mà thuộc tính này thuộc về.
