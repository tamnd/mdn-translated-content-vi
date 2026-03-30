---
title: WindowProxy
slug: Glossary/WindowProxy
page-type: glossary-definition
sidebar: glossarysidebar
---

Đối tượng **`WindowProxy`** là lớp bọc cho đối tượng [`Window`](/en-US/docs/Web/API/Window). Một đối tượng `WindowProxy` tồn tại trong mọi {{Glossary("browsing context")}}. Tất cả các thao tác thực hiện trên đối tượng `WindowProxy` cũng sẽ được áp dụng cho đối tượng `Window` cơ bản mà nó đang bọc. Do đó, tương tác với đối tượng `WindowProxy` gần giống như tương tác trực tiếp với đối tượng `Window`. Khi một ngữ cảnh duyệt web được điều hướng, đối tượng `Window` mà `WindowProxy` bọc sẽ được thay đổi.

## Xem thêm

- Đặc tả HTML: [Phần WindowProxy](https://html.spec.whatwg.org/multipage/window-object.html#the-windowproxy-exotic-object)
- Câu hỏi Stack Overflow: [Đối tượng WindowProxy và Window?](https://stackoverflow.com/questions/16092835/windowproxy-and-window-objects)
