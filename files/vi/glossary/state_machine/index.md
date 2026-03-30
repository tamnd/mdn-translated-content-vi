---
title: State machine
slug: Glossary/State_machine
page-type: glossary-definition
sidebar: glossarysidebar
---

State machine (máy trạng thái) là một trừu tượng toán học được sử dụng để thiết kế các thuật toán. Máy trạng thái đọc một tập hợp đầu vào và chuyển sang trạng thái khác dựa trên các đầu vào đó.

Trạng thái là mô tả tình trạng của một hệ thống đang chờ thực hiện chuyển tiếp. Chuyển tiếp là tập hợp các hành động thực thi khi một điều kiện được thỏa mãn hoặc một sự kiện được nhận. Trong sơ đồ trạng thái, các vòng tròn đại diện cho từng trạng thái có thể có và các mũi tên đại diện cho các chuyển tiếp giữa các trạng thái.

Nhìn vào trạng thái cuối cùng, bạn có thể suy ra điều gì đó về chuỗi đầu vào dẫn đến trạng thái đó.

Có hai loại máy trạng thái cơ bản:

- Máy trạng thái hữu hạn xác định (Deterministic finite state machine)
  - : Loại này chỉ cho phép một chuyển tiếp có thể duy nhất cho bất kỳ đầu vào được phép nào. Điều này giống như câu lệnh "if" trong {{Glossary("statement")}} vì `if x then doThis else doThat` là không thể. Máy tính phải thực hiện _một_ trong hai tùy chọn.
- Máy trạng thái hữu hạn không xác định (Non-deterministic finite state machine)
  - : Với một trạng thái nhất định, một đầu vào có thể dẫn đến nhiều hơn một trạng thái khác nhau.

_Hình 1: Máy trạng thái hữu hạn xác định._

![Máy chuyển từ trạng thái 1 sang trạng thái 2 khi nhập X và từ trạng thái 1 sang trạng thái 3 khi nhập Y](statemachine1.png)

Trong _Hình 1_, trạng thái bắt đầu ở Trạng thái 1; trạng thái chuyển sang Trạng thái 2 khi nhập 'X', hoặc sang Trạng thái 3 khi nhập 'Y'.

_Hình 2: Máy trạng thái hữu hạn không xác định._

![Máy có thể giữ nguyên ở trạng thái 1 hoặc chuyển từ trạng thái 1 sang trạng thái 2 khi nhập X](statemachine2.png)

Trong _Hình 2_, khi nhập 'X', trạng thái có thể duy trì hoặc chuyển sang Trạng thái 2.

Lưu ý rằng bất kỳ {{Glossary("regular expression","biểu thức chính quy")}} nào cũng có thể được biểu diễn bằng một máy trạng thái.

## Xem thêm

- [Máy trạng thái hữu hạn](https://en.wikipedia.org/wiki/Finite-state_machine) trên Wikipedia
- [Máy trạng thái UML](https://en.wikipedia.org/wiki/UML_state_machine) trên Wikipedia
- [Máy Moore](https://en.wikipedia.org/wiki/Moore_machine) trên Wikipedia
- [Máy Mealy](https://en.wikipedia.org/wiki/Mealy_machine) trên Wikipedia
