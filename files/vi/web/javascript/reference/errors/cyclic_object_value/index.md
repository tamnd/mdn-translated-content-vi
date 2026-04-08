---
title: "TypeError: cyclic object value"
slug: Web/JavaScript/Reference/Errors/Cyclic_object_value
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "cyclic object value" xảy ra khi tham chiếu đối tượng vòng tròn được tìm thấy trong [JSON](https://www.json.org/). {{jsxref("JSON.stringify()")}} không cố gắng giải quyết chúng và do đó thất bại.

## Thông báo

```plain
TypeError: Converting circular structure to JSON (V8-based)
TypeError: cyclic object value (Firefox)
TypeError: JSON.stringify cannot serialize cyclic structures. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

[Định dạng JSON](https://www.json.org/) bản thân không hỗ trợ tham chiếu đối tượng (mặc dù có [bản thảo IETF](https://datatracker.ietf.org/doc/html/draft-pbryan-zyp-json-ref-03)), do đó {{jsxref("JSON.stringify()")}} không cố gắng giải quyết chúng và thất bại tương ứng.

## Ví dụ

### Tham chiếu vòng tròn

Trong một cấu trúc vòng tròn như sau:

```js
const circularReference = { otherData: 123 };
circularReference.myself = circularReference;
```

{{jsxref("JSON.stringify()")}} sẽ thất bại

```js example-bad
JSON.stringify(circularReference);
// TypeError: cyclic object value
```

Để tuần tự hóa các tham chiếu vòng tròn, bạn có thể sử dụng thư viện hỗ trợ chúng (ví dụ: [cycle.js](https://github.com/douglascrockford/JSON-js/blob/master/cycle.js)) hoặc tự triển khai giải pháp, cần tìm và thay thế (hoặc xóa) các tham chiếu vòng tròn bằng các giá trị có thể tuần tự hóa được.

Đoạn mã dưới đây minh họa cách tìm và lọc (gây mất dữ liệu) tham chiếu vòng tròn bằng cách sử dụng tham số `replacer` của {{jsxref("JSON.stringify()")}}:

```js
function getCircularReplacer() {
  const ancestors = [];
  return function (key, value) {
    if (typeof value !== "object" || value === null) {
      return value;
    }
    // `this` là đối tượng chứa value,
    // tức là cha trực tiếp của nó.
    while (ancestors.length > 0 && ancestors.at(-1) !== this) {
      ancestors.pop();
    }
    if (ancestors.includes(value)) {
      return "[Circular]";
    }
    ancestors.push(value);
    return value;
  };
}

JSON.stringify(circularReference, getCircularReplacer());
// {"otherData":123,"myself":"[Circular]"}

const o = {};
const notCircularReference = [o, o];
JSON.stringify(notCircularReference, getCircularReplacer());
// [{},{}]
```

## Xem thêm

- {{jsxref("JSON.stringify()")}}
- [cycle.js](https://github.com/douglascrockford/JSON-js/blob/master/cycle.js) trên GitHub
