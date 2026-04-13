---
title: "Text: splitText() method"
short-title: splitText()
slug: Web/API/Text/splitText
page-type: web-api-instance-method
browser-compat: api.Text.splitText
---

{{APIRef("DOM")}}

Phương thức **`splitText()`** của giao diện {{domxref("Text")}} tách nút {{domxref("Text")}} thành hai nút tại vị trí offset được chỉ định, giữ cả hai nút trong cây dưới dạng các nút anh em.

Sau khi tách, nút hiện tại chứa tất cả nội dung cho đến điểm offset được chỉ định, và một nút mới được tạo cùng kiểu chứa phần văn bản còn lại. Nút mới được tạo sẽ được trả về cho người gọi. Nếu nút gốc có cha, nút mới được chèn vào làm nút anh em tiếp theo của nút gốc. Nếu offset bằng độ dài của nút gốc, nút mới được tạo sẽ không có dữ liệu.

Các nút văn bản bị tách có thể được nối lại bằng phương thức {{domxref("Node.normalize()")}}.

## Cú pháp

```js-nolint
splitText(offset)
```

### Tham số

- `offset`
  - : Chỉ số ngay trước điểm tách nút văn bản.

### Giá trị trả về

Trả về nút {{domxref("Text")}} mới được tạo chứa văn bản sau điểm offset được chỉ định.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu offset được chỉ định là âm hoặc lớn hơn số đơn vị 16-bit trong văn bản của nút.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu nút ở chế độ chỉ đọc.

## Ví dụ

Trong ví dụ này, văn bản của {{HTMLElement("p")}} được tách thành hai nút văn bản, và một {{HTMLElement("u")}} được chèn vào giữa chúng.

```html
<p>foobar</p>
```

```js
const p = document.querySelector("p");

// Lấy nội dung của <p> dưới dạng nút văn bản
const foobar = p.firstChild;

// Tách 'foobar' thành hai nút văn bản, 'foo' và 'bar',
// và lưu 'bar' vào hằng số
const bar = foobar.splitText(3);

// Tạo một phần tử <u> chứa ' new content '
const u = document.createElement("u");
u.appendChild(document.createTextNode(" new content "));

// Thêm <u> trước 'bar'
p.insertBefore(u, bar);

// Kết quả là: <p>foo<u> new content </u>bar</p>
```

{{EmbedLiveSample("Example", 700, 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Text")}} mà phương thức này thuộc về.
- Phương thức ngược lại: {{domxref("Node.normalize")}}.
