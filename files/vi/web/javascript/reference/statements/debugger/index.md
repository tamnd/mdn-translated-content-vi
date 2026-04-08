---
title: debugger
slug: Web/JavaScript/Reference/Statements/debugger
page-type: javascript-statement
browser-compat: javascript.statements.debugger
sidebar: jssidebar
---

Câu lệnh **`debugger`** gọi bất kỳ chức năng gỡ lỗi nào có sẵn, chẳng hạn như đặt điểm dừng. Nếu không có chức năng gỡ lỗi nào khả dụng, câu lệnh này không có hiệu lực.

## Cú pháp

```js-nolint
debugger;
```

## Ví dụ

### Sử dụng câu lệnh debugger

Ví dụ sau đây minh họa code có câu lệnh `debugger` được chèn vào, để gọi debugger (nếu có) khi hàm được gọi.

```js
function potentiallyBuggyCode() {
  debugger;
  // do potentially buggy stuff to examine, step through, etc.
}
```

Khi debugger được gọi, việc thực thi bị tạm dừng tại câu lệnh `debugger`. Nó giống như một điểm dừng trong mã nguồn script.

![A browser with developer tools open to the debugger panel showing how execution is paused at the debugger statement to allow close inspection of variables, scopes, events, etc.](screen_shot_2014-02-07_at_9.14.35_am.png)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [The Firefox JavaScript Debugger¶](https://firefox-source-docs.mozilla.org/devtools-user/debugger/index.html) in the Firefox source docs
