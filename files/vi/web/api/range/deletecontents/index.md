---
title: "Range: phương thức deleteContents()"
short-title: deleteContents()
slug: Web/API/Range/deleteContents
page-type: web-api-instance-method
browser-compat: api.Range.deleteContents
---

{{APIRef("DOM")}}

Phương thức **`Range.deleteContents()`** xóa tất cả các nút được chọn hoàn toàn trong range này khỏi tài liệu. Với các nút chỉ được chọn một phần ở đầu hoặc cuối range, chỉ phần văn bản được chọn bị xóa, còn bản thân nút vẫn nguyên vẹn. Sau đó, range được thu gọn về cuối nút được chọn cuối cùng.

## Cú pháp

```js-nolint
deleteContents()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dùng deleteContents()

Chọn một số văn bản, có thể trải qua nhiều đoạn, rồi nhấn nút để xóa văn bản đã chọn. Mở trình kiểm tra DOM để xem cấu trúc DOM đã cập nhật.

```html
<p>paragraph 1</p>
<p>paragraph 2</p>
<p>paragraph 3</p>
<button id="delete">Delete selected text</button>
<button id="reset">Reset</button>
```

```js
const button = document.getElementById("delete");
const reset = document.getElementById("reset");
const output = document.getElementById("output");

button.addEventListener("click", () => {
  const range = document.getSelection().getRangeAt(0);
  range.deleteContents();
});

reset.addEventListener("click", () => {
  window.location.reload();
});
```

{{EmbedLiveSample("using_deletecontents", "", "150")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
