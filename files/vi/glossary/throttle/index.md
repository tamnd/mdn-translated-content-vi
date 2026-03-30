---
title: Throttle
slug: Glossary/Throttle
page-type: glossary-definition
sidebar: glossarysidebar
---

**Throttling** ban đầu có nghĩa là làm chậm tốc độ dòng chảy của chất lỏng bằng cách sử dụng vật cản. Trong ngữ cảnh lập trình, nó đề cập đến việc làm chậm một quá trình sao cho một thao tác chỉ có thể được thực hiện ở một tốc độ nhất định.

Throttling rất giống với {{glossary("debounce", "debouncing")}}. Điểm khác biệt chính là khi các lần gọi xảy ra liên tục, throttling đảm bảo rằng thao tác vẫn được thực hiện ở một tốc độ tối đa nhất định, trong khi debouncing chờ vô thời hạn cho đến khi các lần gọi dừng lại trong một khoảng thời gian nhất định.

Một trường hợp sử dụng điển hình của throttling là khi đồng bộ hóa với một trạng thái liên tục thay đổi. Hãy xem xét hàm `onScrolled`, lắng nghe sự kiện [`scroll`](/en-US/docs/Web/API/Document/scroll_event). Sự kiện `scroll` có thể kích hoạt với mỗi pixel được cuộn, vì vậy hàm sẽ được gọi trong khoảng thời gian rất ngắn. Nếu `onScrolled` tốn nhiều tài nguyên tính toán, các lần gọi trước có thể chặn các lần gọi sau xảy ra đúng lúc, hoặc chặn các việc khác thực thi trong thời gian chờ, dẫn đến hiện tượng {{glossary("jank")}} đáng chú ý. Trong trường hợp này, chúng ta có thể throttle `onScrolled` để nó chỉ được gọi tối đa một lần mỗi 10 mili giây:

1. Lần gọi đầu tiên đến `onScrolled` được gọi là _cạnh dẫn đầu_ (leading edge).
2. Với mỗi lần gọi tiếp theo đến `onScrolled`, nếu nó nằm trong 10 mili giây kể từ lần gọi đầu tiên, nó thuộc cùng "nhóm" với lần gọi đầu tiên.
3. Sau khi 10 mili giây trôi qua kể từ lần gọi đầu tiên đến `onScrolled`, chúng ta đã đạt đến _cạnh kéo dài_ (trailing edge).

Thông thường, `onScrolled` được thực thi một lần ở cạnh dẫn đầu, mặc dù đôi khi nó có thể được thực thi ở cạnh kéo dài, hoặc thậm chí cả hai cạnh, tùy thuộc vào trường hợp sử dụng cụ thể. Nếu được thực thi ở cả hai cạnh, việc triển khai throttling thường đảm bảo rằng lần gọi cạnh dẫn đầu tiếp theo không kích hoạt ít nhất 10 mili giây sau cạnh kéo dài trước đó.

Thông qua throttling, hiệu ứng của `onScrolled` vẫn được cập nhật và áp dụng liên tục — ví dụ, nếu nó di chuyển một phần tử DOM khác dựa trên vị trí cuộn của tài liệu, phần tử DOM đó vẫn di chuyển liên tục trong khi trang đang cuộn — nhưng nó không được thực thi thường xuyên hơn mức cần thiết.

{{glossary("Network throttling", "Giới hạn băng thông mạng")}} có nghĩa là mô phỏng kết nối mạng chậm hơn bằng cách chỉ cho phép một lượng dữ liệu nhất định được truyền tại một thời điểm. _Throttling một bộ hẹn giờ_ có nghĩa là làm thô độ chính xác của bộ hẹn giờ sao cho khi đọc bộ hẹn giờ (chẳng hạn {{jsxref("Date.now()")}}) liên tục, giá trị của bộ hẹn giờ chỉ thay đổi ở một tốc độ tối đa nhất định. Cả hai đều là các ứng dụng cụ thể của khái niệm throttling chung.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Debounce")}}
  - {{Glossary("Rate limit")}}
- [Debouncing and Throttling Explained Through Examples](https://css-tricks.com/debouncing-throttling-explained-examples/) trên CSS-Tricks (ngày 6 tháng 4 năm 2016)
