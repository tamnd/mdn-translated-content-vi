---
title: "HTMLElement: thuộc tính writingSuggestions"
short-title: writingSuggestions
slug: Web/API/HTMLElement/writingSuggestions
page-type: web-api-instance-property
browser-compat: api.HTMLElement.writingSuggestions
---

{{APIRef("HTML DOM")}}

Thuộc tính **`writingSuggestions`** của giao diện {{domxref("HTMLElement")}} là một chuỗi cho biết liệu các gợi ý viết do trình duyệt cung cấp có được bật trong phạm vi của phần tử hay không.

Nó phản ánh giá trị của thuộc tính HTML toàn cục [`writingsuggestions`](/en-US/docs/Web/HTML/Reference/Global_attributes/writingsuggestions).

## Giá trị

Một giá trị liệt kê; các giá trị có thể là:

- `"true"`
  - : Trình duyệt tự động hiển thị bàn phím ảo khi người dùng chạm hoặc tiêu điểm vào phần tử.
- `"false"`
  - : Trình duyệt không tự động hiển thị bàn phím ảo: việc hiển thị/ẩn bàn phím ảo được xử lý thủ công bằng tập lệnh.

## Ví dụ

Ví dụ sau đây cho thấy cách tắt các gợi ý viết do tác nhân người dùng cung cấp qua tập lệnh:

```js
const element = document.querySelector("input");

// disable user agent writing suggestions
element.writingSuggestions = "false";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`writingsuggestions`](/en-US/docs/Web/HTML/Reference/Global_attributes/writingsuggestions)
