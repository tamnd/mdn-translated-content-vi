---
title: "Text: wholeText property"
short-title: wholeText
slug: Web/API/Text/wholeText
page-type: web-api-instance-property
browser-compat: api.Text.wholeText
---

{{ apiref("DOM") }}

Thuộc tính chỉ đọc **`wholeText`** của giao diện {{domxref("Text")}} trả về toàn bộ văn bản của tất cả các nút {{domxref("Text")}} liền kề về mặt logic với nút đó. Văn bản được nối theo thứ tự trong tài liệu. Điều này cho phép chỉ định bất kỳ nút văn bản nào và lấy tất cả văn bản liền kề dưới dạng một chuỗi đơn.

> [!NOTE]
> Điều này tương tự với việc gọi {{domxref("Node.normalize()")}} rồi đọc giá trị văn bản, nhưng không sửa đổi cây.

## Giá trị

Một chuỗi với văn bản được nối.

## Ví dụ

Giả sử bạn có đoạn văn đơn giản sau trong trang web của mình:

```html
<p>
  Through-hiking is great!
  <strong>No insipid election coverage!</strong> However,
  <a href="https://en.wikipedia.org/wiki/Absentee_ballot">casting a ballot</a>
  is tricky.
</p>
```

Bạn quyết định không thích câu ở giữa và xóa nó:

```js
const paragraph = document.querySelector("p"); // Đọc đoạn văn
paragraph.removeChild(paragraph.childNodes[1]); // Xóa phần tử strong
```

Bây giờ bạn có _"Through-hiking is great! However, casting a ballot is tricky."_, với hai nút trước siêu liên kết:

1. Một {{domxref("Text")}} chứa chuỗi `"Through-hiking is great!"`
2. Một nút `Text` thứ hai chứa chuỗi `" However, "`

Để lấy cả hai nút đó cùng một lúc, bạn gọi `paragraph.childNodes[0].wholeText`:

```js
console.log(`'${paragraph.childNodes[0].wholeText}'`); // 'Through-hiking is great!   However, '
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Text")}} mà thuộc tính này thuộc về.
