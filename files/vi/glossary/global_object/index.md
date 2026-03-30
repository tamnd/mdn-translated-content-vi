---
title: Global object
slug: Glossary/Global_object
page-type: glossary-definition
sidebar: glossarysidebar
---

**Đối tượng toàn cục** trong JavaScript là một {{glossary("object")}} đại diện cho {{glossary("global scope")}}.

> [!NOTE]
> _Các đối tượng khả dụng toàn cục_, là các đối tượng trong {{glossary("global scope")}}, đôi khi cũng được gọi là các đối tượng toàn cục, nhưng về mặt chặt chẽ, chỉ có một đối tượng toàn cục cho mỗi môi trường.

Trong mỗi môi trường JavaScript, luôn có một đối tượng toàn cục được định nghĩa. Giao diện của đối tượng toàn cục phụ thuộc vào ngữ cảnh thực thi mà script đang chạy. Ví dụ:

- Trong trình duyệt web, bất kỳ code nào mà script không khởi động cụ thể như một tác vụ nền đều có {{domxref("Window")}} là đối tượng toàn cục của nó. Đây là phần lớn code JavaScript trên Web.
- Code chạy trong {{domxref("Worker")}} có đối tượng {{domxref("WorkerGlobalScope")}} là đối tượng toàn cục của nó.
- Các script chạy trong {{Glossary("Node.js")}} có một đối tượng được gọi là [`global`](https://nodejs.org/api/globals.html#globals_global) là đối tượng toàn cục của chúng.

Thuộc tính toàn cục [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis) cho phép truy cập đối tượng toàn cục bất kể môi trường hiện tại.

Các câu lệnh [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) và [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function) ở cấp độ đầu của một script tạo ra các thuộc tính của đối tượng toàn cục. Mặt khác, khai báo {{jsxref("Statements/let", "let")}} và {{jsxref("Statements/const", "const")}} không bao giờ tạo ra các thuộc tính của đối tượng toàn cục.

Các thuộc tính của đối tượng toàn cục được tự động thêm vào {{glossary("global scope")}}.

Trong JavaScript, đối tượng toàn cục luôn giữ một tham chiếu đến chính nó:

```js
console.log(globalThis === globalThis.globalThis); // true (ở mọi nơi)
console.log(window === window.window); // true (trong trình duyệt)
console.log(self === self.self); // true (trong trình duyệt hoặc Web Worker)
console.log(frames === frames.frames); // true (trong trình duyệt)
console.log(global === global.global); // true (trong Node.js)
```

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("global scope")}}
  - {{glossary("object")}}
- {{jsxref("globalThis")}}
- {{domxref("Window")}}
- {{domxref("WorkerGlobalScope")}}
- {{domxref("Window.window")}}
- {{domxref("Window.self")}}
- {{domxref("Window.frames")}}
- {{domxref("WorkerGlobalScope.self")}}
- [`global`](https://nodejs.org/api/globals.html#globals_global)
