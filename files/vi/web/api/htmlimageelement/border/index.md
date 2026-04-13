---
title: "HTMLImageElement: border property"
short-title: border
slug: Web/API/HTMLImageElement/border
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLImageElement.border
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính _deprecated_ **`border`** của giao diện {{domxref("HTMLImageElement")}} chỉ định số pixel dày mà đường viền xung quanh hình ảnh phải có. Giá trị mặc định là 0, cho biết không nên vẽ đường viền. Nó phản ánh thuộc tính nội dung [`border`](/en-US/docs/Web/HTML/Reference/Elements/img#border) của phần tử `<img>`.

Thay vào đó, bạn nên sử dụng thuộc tính CSS {{cssxref("border")}} hoặc các thuộc tính dài hạn của nó để không chỉ đặt độ dày của đường viền mà còn có khả năng áp dụng nhiều tùy chọn kiểu dáng khác cho nó.

## Giá trị

Một chuỗi chứa giá trị số nguyên chỉ định độ dày của đường viền bao quanh hình ảnh, tính bằng pixel CSS. Giá trị `0` hoặc một chuỗi trống cho biết không được vẽ đường viền. Giá trị mặc định của `border` là `0`.

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển thành chuỗi trống (`""`), vì vậy `elt.border = null` tương đương với `elt.border = ""`.

## Ví dụ

### Đặt thuộc tính đường viền

```js example-bad
const img = new Image();
img.src = "example.png";
img.border = "1";
```

Thay vì sử dụng thuộc tính `border` không được dùng nữa, thay vào đó hãy xem xét việc đặt thuộc tính CSS `border`:

```js example-good
const img = new Image();
img.src = "example.png";
img.style.border = "1px solid black";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
