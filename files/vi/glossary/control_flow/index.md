---
title: Luồng điều khiển
slug: Glossary/Control_flow
page-type: glossary-definition
sidebar: glossarysidebar
---

**Luồng điều khiển** (control flow) là thứ tự mà máy tính thực thi các câu lệnh trong một tập lệnh.

Mã được chạy theo thứ tự từ dòng đầu tiên trong tệp đến dòng cuối cùng, trừ khi máy tính gặp các cấu trúc (rất phổ biến) thay đổi luồng điều khiển, chẳng hạn như điều kiện và vòng lặp.

Ví dụ, hãy tưởng tượng một tập lệnh dùng để xác thực dữ liệu người dùng từ biểu mẫu trang web. Tập lệnh gửi dữ liệu đã được xác thực, nhưng nếu người dùng bỏ trống một trường bắt buộc, tập lệnh sẽ nhắc họ điền vào. Để làm điều này, tập lệnh sử dụng cấu trúc {{Glossary("Conditional", "điều kiện")}} hay `if...else`, để các đoạn mã khác nhau được thực thi tùy thuộc vào việc biểu mẫu có đầy đủ hay không:

```js
if (isEmpty(field)) {
  promptUser();
} else {
  submitForm();
}
```

Một tập lệnh điển hình trong {{glossary("JavaScript")}} hoặc {{glossary("PHP")}} (và tương tự) bao gồm nhiều cấu trúc điều khiển, bao gồm điều kiện, {{Glossary("Loop", "vòng lặp")}} và {{Glossary("Function", "hàm")}}. Các phần của tập lệnh cũng có thể được đặt để thực thi khi {{Glossary("Event", "sự kiện")}} xảy ra.

Luồng điều khiển có nghĩa là khi đọc một tập lệnh, bạn không chỉ đọc từ đầu đến cuối mà còn phải xem xét cấu trúc chương trình và cách nó ảnh hưởng đến thứ tự thực thi.

## Xem thêm

- [Tham chiếu JavaScript - Luồng điều khiển](/en-US/docs/Web/JavaScript/Reference#control_flow)
- [Luồng điều khiển và xử lý lỗi](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling)
- [Control flow](https://en.wikipedia.org/wiki/Control_flow) trên Wikipedia
