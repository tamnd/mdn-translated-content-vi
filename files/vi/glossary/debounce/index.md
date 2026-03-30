---
title: Debounce
slug: Glossary/Debounce
page-type: glossary-definition
sidebar: glossarysidebar
---

**Debouncing**, trong ngữ cảnh lập trình, có nghĩa là loại bỏ các hoạt động xảy ra quá gần nhau trong một khoảng thời gian cụ thể, và hợp nhất chúng thành một lần gọi duy nhất.

Debouncing rất giống với {{glossary("throttle","throttling")}}. Sự khác biệt chính là throttling áp đặt giới hạn đối với các hoạt động liên tục, trong khi debouncing chờ các lần gọi dừng lại trong một khoảng thời gian cụ thể để hợp nhất nhiều lần gọi ồn ào thành một lần gọi duy nhất.

Trường hợp sử dụng điển hình của debouncing là khi phản hồi đầu vào của người dùng. Khi người dùng đang gõ, không nên thực hiện hành động nào khác để tránh giao diện người dùng bị chậm. Khi người dùng tạm dừng gõ, chúng ta có thể bắt đầu xử lý đầu vào, như lọc kết quả, đưa ra gợi ý, v.v. Nếu hàm `search` được debounce 10 mili giây, điều đó có nghĩa là:

1. Lần gọi đầu tiên đến `search` được gọi là _cạnh dẫn_ (leading edge).
2. Đối với mỗi lần gọi tiếp theo đến `search`, nếu nó nằm trong 10 mili giây kể từ lần gọi trước, nó thuộc cùng "nhóm" với lần gọi trước.
3. Sau khi 10 mili giây đã trôi qua từ lần gọi cuối cùng đến `search`, nếu không có lần gọi nào khác xảy ra, chúng ta đã đến _cạnh cuối_ (trailing edge).

Thông thường, `search` được thực thi một lần ở cạnh cuối, mặc dù đôi khi nó có thể được thực thi ở cạnh dẫn, hoặc thậm chí cả hai cạnh, tùy thuộc vào trường hợp sử dụng cụ thể.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Throttle")}}
  - {{Glossary("Rate limit")}}
- [Debouncing and Throttling Explained Through Examples](https://css-tricks.com/debouncing-throttling-explained-examples/) trên CSS-Tricks (ngày 6 tháng 4 năm 2016)
