---
title: NaN
slug: Glossary/NaN
page-type: glossary-definition
sidebar: glossarysidebar
---

NaN (Not a Number - Không phải số) là một {{Glossary("Type", "kiểu dữ liệu")}} số có nghĩa là một giá trị không xác định hoặc giá trị không thể biểu diễn, đặc biệt là kết quả của các phép tính dấu phẩy động.

Ví dụ, NaN có thể biểu diễn vô cực, kết quả của phép chia cho không, giá trị bị thiếu, hoặc căn bậc hai của số âm (là số ảo, trong khi số dấu phẩy động là số thực).

Trên thực tế, nếu tôi chia hai biến trong chương trình {{glossary("JavaScript")}}, kết quả có thể là NaN, được JavaScript định nghĩa trước là "undefined". Do đó phép chia này có thể làm hỏng chương trình. Nếu phép tính này là một phần nhỏ của một thuật toán lớn hơn nhiều, sẽ rất khó để tìm ra lỗi thực sự xảy ra ở đâu. May mắn thay, vì kết quả sẽ là NaN và tôi biết số chia của mình có thể ra 0, tôi có thể thiết lập các điều kiện kiểm tra để ngăn chặn các phép tính như vậy ngay từ đầu hoặc thông báo cho tôi biết chúng xảy ra ở đâu.

## Xem thêm

- [NaN](https://en.wikipedia.org/wiki/NaN) trên Wikipedia
- [NaN trong JavaScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN)
