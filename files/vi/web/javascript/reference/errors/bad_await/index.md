---
title: "SyntaxError: await is only valid in async functions, async generators and modules"
slug: Web/JavaScript/Reference/Errors/Bad_await
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "await is only valid in async functions, async generators and modules" xảy ra khi biểu thức {{jsxref("Operators/await", "await")}} được sử dụng bên ngoài [async functions](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc [modules](/en-US/docs/Web/JavaScript/Guide/Modules) hoặc các ngữ cảnh async khác.

## Thông báo

```plain
SyntaxError: await is only valid in async functions and the top level bodies of modules (V8-based)
SyntaxError: await is only valid in async functions, async generators and modules (Firefox)
SyntaxError: Unexpected identifier (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Việc thực thi JavaScript không bao giờ bị chặn: `await` không bao giờ có thể chặn việc thực thi chương trình. Thay vào đó, nó tạm dừng việc thực thi của tác vụ async xung quanh, trong khi cho phép các tác vụ khác tiếp tục chạy. Do đó, `await` không thể được sử dụng trong các tác vụ đồng bộ, chẳng hạn như hàm, hàm generator, hoặc cấp cao nhất của script. Không phải lúc nào cũng rõ ràng liệu file hiện tại là script hay module — xem [hướng dẫn Modules](/en-US/docs/Web/JavaScript/Guide/Modules#top_level_await) để biết thêm thông tin.

## Ví dụ

### Top-level await

Bạn không thể sử dụng `await` ở cấp cao nhất của một script:

```html example-bad
<script>
  await fetch("https://example.com");
  // SyntaxError: await is only valid in async functions, async generators and modules
</script>
```

Thay vào đó, hãy biến script thành một module:

```html example-good
<script type="module">
  await fetch("https://example.com");
</script>
```

### Async callbacks

Bạn không thể sử dụng `await` trong một callback đồng bộ:

```js-nolint example-bad
urls.forEach((url) => {
  await fetch(url);
  // SyntaxError: await is only valid in async functions, async generators and modules
});
```

Thay vào đó, hãy làm cho callback trở thành async. Xem thêm giải thích trong [hướng dẫn Using promises](/en-US/docs/Web/JavaScript/Guide/Using_promises#composition).

```js example-good
Promise.all(
  urls.map(async (url) => {
    await fetch(url);
  }),
);
```

## Xem thêm

- {{jsxref("Operators/await", "await")}}
