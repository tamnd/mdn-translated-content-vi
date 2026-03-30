---
title: Invariant
slug: Glossary/Invariant
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong ngữ nghĩa chương trình, một **bất biến** (invariant) của một đoạn mã là điều kiện có thể chứng minh là đúng trong suốt quá trình thực thi đoạn mã đó. Việc xác định các bất biến giúp lý luận về tính đúng đắn và hành vi của mã.

Ví dụ, trong đoạn mã sau:

```js
let count = 0;
while (hasMessages()) {
  count++;
  processMessage();
}
```

Chúng ta có thể chứng minh rằng `count` là một số nguyên không âm từ đầu đến cuối. Điều này có nghĩa là bất kỳ đâu trong mã, chúng ta có thể truyền `count` cho một hàm yêu cầu số nguyên không âm, và hàm đó sẽ hoạt động đúng.

Bất biến có thể được thiết lập theo hai cách: bởi bản chất của chương trình, hoặc bởi các khẳng định tường minh (kiểm tra thời gian chạy). Ví dụ, mã trên không thực hiện bất kỳ kiểm tra nào, nhưng nhờ `count` là một số nguyên tăng dần bắt đầu từ `0`, chúng ta có thể đảm bảo phạm vi của nó. Nếu chúng ta nhận đầu vào từ nguồn bên ngoài, chúng ta có thể sử dụng kiểm tra để thiết lập bất biến tại ranh giới:

```js
function processInput(input) {
  if (input < 0 || !Number.isInteger(input)) {
    throw new Error("Input must be a non-negative integer");
  }
  // Process input...
}
```

Bất biến đặc biệt hữu ích trong các hệ thống phức tạp không thể thực hiện kiểm tra toàn diện ở mọi bước. Chúng ta thiết lập bất biến tại ranh giới hệ thống, và sau đó bất kỳ mã nào tiếp theo đều có thể giả định những thuộc tính đó mà không cần kiểm tra lại.

Nói chung, bất cứ điều gì có thể được giả định là đúng đều là một bất biến. Ví dụ, một đặc tả có thể để một tính năng là do triển khai tự quyết định nhưng với các bất biến nhất định, có nghĩa là những thuộc tính đó sẽ luôn đúng bất kể hành vi chính xác là gì.
