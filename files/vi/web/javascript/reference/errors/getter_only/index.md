---
title: 'TypeError: setting getter-only property "x"'
slug: Web/JavaScript/Reference/Errors/Getter_only
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript chỉ xảy ra trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "setting getter-only property" xảy ra khi có nỗ lực đặt giá trị mới cho một thuộc tính chỉ có [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) được chỉ định, hoặc khi đặt [thuộc tính accessor private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) tương tự chỉ có getter được định nghĩa.

## Thông báo

```plain
TypeError: Cannot set property x of #<Object> which has only a getter (V8-based)
TypeError: '#x' was defined without a setter (V8-based)
TypeError: setting getter-only property "x" (Firefox)
TypeError: Attempted to assign to readonly property. (Safari)
TypeError: Trying to access an undefined private setter (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}} chỉ trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Điều gì đã xảy ra?

Có nỗ lực đặt giá trị mới cho một thuộc tính chỉ có [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) được chỉ định. Mặc dù điều này sẽ bị bỏ qua trong chế độ non-strict, nó sẽ ném {{jsxref("TypeError")}} trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Các lớp luôn ở chế độ strict, vì vậy việc gán cho một phần tử private chỉ có getter luôn ném lỗi này.

## Ví dụ

### Thuộc tính không có setter

Ví dụ dưới đây cho thấy cách đặt getter cho một thuộc tính. Nó không chỉ định [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set), vì vậy `TypeError` sẽ được ném khi cố gắng đặt thuộc tính `temperature` thành `30`. Để biết thêm chi tiết, xem trang {{jsxref("Object.defineProperty()")}}.

```js example-bad
"use strict";

function Archiver() {
  const temperature = null;
  Object.defineProperty(this, "temperature", {
    get() {
      console.log("get!");
      return temperature;
    },
  });
}

const arc = new Archiver();
arc.temperature; // 'get!'

arc.temperature = 30;
// TypeError: setting getter-only property "temperature"
```

Để sửa lỗi này, bạn cần xóa dòng `arc.temperature = 30` đang cố đặt thuộc tính temperature, hoặc bạn cần triển khai [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) cho nó, ví dụ như sau:

```js example-good
"use strict";

function Archiver() {
  let temperature = null;
  const archive = [];

  Object.defineProperty(this, "temperature", {
    get() {
      console.log("get!");
      return temperature;
    },
    set(value) {
      temperature = value;
      archive.push({ val: temperature });
    },
  });

  this.getArchive = function () {
    return archive;
  };
}

const arc = new Archiver();
arc.temperature; // 'get!'
arc.temperature = 11;
arc.temperature = 13;
arc.getArchive(); // [{ val: 11 }, { val: 13 }]
```

## Xem thêm

- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.defineProperties()")}}
