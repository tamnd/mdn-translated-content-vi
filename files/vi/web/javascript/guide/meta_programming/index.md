---
title: Meta programming
slug: Web/JavaScript/Guide/Meta_programming
page-type: guide
sidebar: jssidebar
---

Các object {{jsxref("Proxy")}} và {{jsxref("Reflect")}} cho phép bạn chặn và định nghĩa hành vi tùy chỉnh cho các phép toán ngôn ngữ cơ bản (ví dụ: tra cứu thuộc tính, gán giá trị, liệt kê, gọi hàm, v.v.). Với sự hỗ trợ của hai object này, bạn có thể lập trình ở cấp độ meta của JavaScript.

## Proxy

Các object {{jsxref("Proxy")}} cho phép bạn chặn một số phép toán nhất định và triển khai hành vi tùy chỉnh.

Ví dụ, lấy một thuộc tính trên một object:

```js
const handler = {
  get(target, name) {
    return name in target ? target[name] : 42;
  },
};

const p = new Proxy({}, handler);
p.a = 1;
console.log(p.a, p.b); // 1, 42
```

Object `Proxy` định nghĩa một `target` (một object rỗng ở đây) và một object `handler`, trong đó một _trap_ `get` được triển khai. Ở đây, một object được proxy sẽ không trả về `undefined` khi lấy các thuộc tính không tồn tại, mà thay vào đó trả về số `42`.

Có thêm các ví dụ trên trang tham chiếu {{jsxref("Proxy")}}.

### Thuật ngữ

Các thuật ngữ sau đây được sử dụng khi nói về chức năng của proxy.

- {{jsxref("Proxy/Proxy", "handler", "", 1)}}
  - : Object giữ chỗ chứa các trap.
- trap
  - : Các phương thức cung cấp quyền truy cập thuộc tính. (Điều này tương tự như khái niệm _trap_ trong hệ điều hành.)
- target
  - : Object mà proxy ảo hóa. Nó thường được sử dụng như bộ nhớ nền cho proxy. Các bất biến (invariant - ngữ nghĩa không thay đổi) liên quan đến tính không thể mở rộng của object hoặc các thuộc tính không thể cấu hình được kiểm tra đối với target.
- {{Glossary("invariant", "invariant")}}
  - : Ngữ nghĩa không thay đổi khi triển khai các phép toán tùy chỉnh được gọi là _invariant_. Nếu bạn vi phạm các invariant của một handler, một {{jsxref("TypeError")}} sẽ được ném ra.

## Handler và trap

Bảng sau đây tóm tắt các trap có sẵn cho các object `Proxy`. Xem [các trang tham chiếu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy) để biết giải thích chi tiết và ví dụ.

<table class="standard-table">
  <thead>
    <tr>
      <th>Handler / trap</th>
      <th>Interceptions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/getPrototypeOf", "handler.getPrototypeOf()")}}
      </td>
      <td>
        {{jsxref("Object.getPrototypeOf()")}}<br />{{jsxref("Reflect.getPrototypeOf()")}}<br />{{jsxref("Object/proto", "__proto__")}}<br />{{jsxref("Object.prototype.isPrototypeOf()")}}<br />{{jsxref("Operators/instanceof", "instanceof")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/setPrototypeOf", "handler.setPrototypeOf()")}}
      </td>
      <td>
        {{jsxref("Object.setPrototypeOf()")}}<br />{{jsxref("Reflect.setPrototypeOf()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/isExtensible", "handler.isExtensible()")}}
      </td>
      <td>
        {{jsxref("Object.isExtensible()")}}<br />{{jsxref("Reflect.isExtensible()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/preventExtensions", "handler.preventExtensions()")}}
      </td>
      <td>
        {{jsxref("Object.preventExtensions()")}}<br />{{jsxref("Reflect.preventExtensions()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/getOwnPropertyDescriptor", "handler.getOwnPropertyDescriptor()")}}
      </td>
      <td>
        {{jsxref("Object.getOwnPropertyDescriptor()")}}<br />{{jsxref("Reflect.getOwnPropertyDescriptor()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/defineProperty", "handler.defineProperty()")}}
      </td>
      <td>
        {{jsxref("Object.defineProperty()")}}<br />{{jsxref("Reflect.defineProperty()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/has", "handler.has()")}}
      </td>
      <td>
        <dl>
          <dt>Property query</dt>
          <dd><code>foo in proxy</code></dd>
          <dt>Inherited property query</dt>
          <dd>
            <code>foo in Object.create(<var>proxy</var>)</code
            ><br />{{jsxref("Reflect.has()")}}
          </dd>
        </dl>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/get", "handler.get()")}}
      </td>
      <td>
        <dl>
          <dt>Property access</dt>
          <dd>
            <code><var>proxy</var>[foo]</code><br /><code
              ><var>proxy</var>.bar</code
            >
          </dd>
          <dt>Inherited property access</dt>
          <dd>
            <!-- markdownlint-disable MD011 -->
            <code>Object.create(<var>proxy</var>)[foo]</code
            ><br />{{jsxref("Reflect.get()")}}
          </dd>
        </dl>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/set", "handler.set()")}}
      </td>
      <td>
        <dl>
          <dt>Property assignment</dt>
          <dd>
            <code><var>proxy</var>[foo] = bar</code><br /><code
              ><var>proxy</var>.foo = bar</code
            >
          </dd>
          <dt>Inherited property assignment</dt>
          <dd>
            <code>Object.create(<var>proxy</var>)[foo] = bar</code
            ><br />{{jsxref("Reflect.set()")}}
          </dd>
            <!-- markdownlint-enable MD011 -->
        </dl>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/deleteProperty", "handler.deleteProperty()")}}
      </td>
      <td>
        <dl>
          <dt>Property deletion</dt>
          <dd>
            <code>delete <var>proxy</var>[foo]</code><br /><code
              >delete <var>proxy</var>.foo</code
            ><br />{{jsxref("Reflect.deleteProperty()")}}
          </dd>
        </dl>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/ownKeys", "handler.ownKeys()")}}
      </td>
      <td>
        {{jsxref("Object.getOwnPropertyNames()")}}<br />{{jsxref("Object.getOwnPropertySymbols()")}}<br />{{jsxref("Object.keys()")}}<br />{{jsxref("Reflect.ownKeys()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/apply", "handler.apply()")}}
      </td>
      <td>
        <code>proxy(..args)</code
        ><br />{{jsxref("Function.prototype.apply()")}} and
        {{jsxref("Function.prototype.call()")}}<br />{{jsxref("Reflect.apply()")}}
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Proxy/Proxy/construct", "handler.construct()")}}
      </td>
      <td>
        <code>new proxy(...args)</code
        ><br />{{jsxref("Reflect.construct()")}}
      </td>
    </tr>
  </tbody>
</table>

## `Proxy` có thể thu hồi

Phương thức {{jsxref("Proxy.revocable()")}} được dùng để tạo một object `Proxy` có thể thu hồi. Điều này có nghĩa là proxy có thể bị thu hồi thông qua hàm `revoke` và tắt proxy đó.

Sau đó, bất kỳ phép toán nào trên proxy sẽ dẫn đến {{jsxref("TypeError")}}.

```js
const revocable = Proxy.revocable(
  {},
  {
    get(target, name) {
      return `[[${name}]]`;
    },
  },
);
const proxy = revocable.proxy;
console.log(proxy.foo); // "[[foo]]"

revocable.revoke();

console.log(proxy.foo); // TypeError: Cannot perform 'get' on a proxy that has been revoked
proxy.foo = 1; // TypeError: Cannot perform 'set' on a proxy that has been revoked
delete proxy.foo; // TypeError: Cannot perform 'deleteProperty' on a proxy that has been revoked
console.log(typeof proxy); // "object", typeof doesn't trigger any trap
```

## Reflection

{{jsxref("Reflect")}} là một object tích hợp sẵn cung cấp các phương thức cho các phép toán JavaScript có thể bị chặn. Các phương thức này giống với các phương thức của [proxy handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy).

`Reflect` không phải là một function object.

`Reflect` giúp chuyển tiếp các phép toán mặc định từ handler đến `target`.

Với {{jsxref("Reflect.has()")}} chẳng hạn, bạn có thể sử dụng [toán tử `in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) như một hàm:

```js
Reflect.has(Object, "assign"); // true
```

### Hàm apply() tốt hơn

Trước khi có `Reflect`, bạn thường sử dụng phương thức {{jsxref("Function.prototype.apply()")}} để gọi một hàm với giá trị `this` và `arguments` được cung cấp dưới dạng mảng (hoặc một [object dạng mảng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects)).

```js
Function.prototype.apply.call(Math.floor, undefined, [1.75]);
```

Với {{jsxref("Reflect.apply")}} điều này trở nên ít dài dòng hơn và dễ hiểu hơn:

```js
Reflect.apply(Math.floor, undefined, [1.75]);
// 1

Reflect.apply(String.fromCharCode, undefined, [104, 101, 108, 108, 111]);
// "hello"

Reflect.apply(RegExp.prototype.exec, /ab/, ["confabulation"]).index;
// 4

Reflect.apply("".charAt, "ponies", [3]);
// "i"
```

### Kiểm tra xem việc định nghĩa thuộc tính có thành công không

Với {{jsxref("Object.defineProperty")}}, trả về một object nếu thành công hoặc ném {{jsxref("TypeError")}} nếu thất bại, bạn sẽ dùng khối {{jsxref("Statements/try...catch", "try...catch")}} để bắt bất kỳ lỗi nào xảy ra khi định nghĩa thuộc tính. Vì {{jsxref("Reflect.defineProperty()")}} trả về trạng thái thành công dạng Boolean, bạn có thể chỉ cần dùng khối {{jsxref("Statements/if...else", "if...else")}} ở đây:

```js
if (Reflect.defineProperty(target, property, attributes)) {
  // success
} else {
  // failure
}
```
