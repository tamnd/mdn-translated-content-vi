---
title: Standard built-in objects
slug: Web/JavaScript/Reference/Global_Objects
page-type: landing-page
sidebar: jssidebar
---

Chương này ghi lại tất cả các đối tượng tiêu chuẩn, được tích hợp sẵn của JavaScript, bao gồm các phương thức và thuộc tính của chúng.

Thuật ngữ "global objects" (hay standard built-in objects) ở đây không nên nhầm lẫn với **global object**. Ở đây, "global objects" đề cập đến **các đối tượng trong global scope**.

Bản thân **global object** có thể được truy cập bằng toán tử {{jsxref("Operators/this", "this")}} trong global scope. Trên thực tế, global scope **bao gồm** các thuộc tính của global object, trong đó có cả các thuộc tính kế thừa, nếu có.

Các đối tượng khác trong global scope được [tạo bởi user script](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#creating_new_objects) hoặc được cung cấp bởi ứng dụng host. Các host object có trong ngữ cảnh trình duyệt được ghi lại trong [API reference](/en-US/docs/Web/API).

Để biết thêm thông tin về sự khác biệt giữa [DOM](/en-US/docs/Web/API/Document_Object_Model) và core [JavaScript](/en-US/docs/Web/JavaScript), xem [JavaScript technologies overview](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview).

## Các đối tượng tiêu chuẩn theo danh mục

### Thuộc tính giá trị

Các thuộc tính toàn cục này trả về một giá trị đơn giản. Chúng không có thuộc tính hay phương thức nào.

- {{jsxref("globalThis")}}
- {{jsxref("Infinity")}}
- {{jsxref("NaN")}}
- {{jsxref("undefined")}}

### Thuộc tính hàm

Các hàm toàn cục này — các hàm được gọi trực tiếp từ global scope thay vì trên một đối tượng — trả về kết quả trực tiếp cho phía gọi.

- {{jsxref("Global_Objects/eval", "eval()")}}
- {{jsxref("isFinite()")}}
- {{jsxref("isNaN()")}}
- {{jsxref("parseFloat()")}}
- {{jsxref("parseInt()")}}
- {{jsxref("decodeURI()")}}
- {{jsxref("decodeURIComponent()")}}
- {{jsxref("encodeURI()")}}
- {{jsxref("encodeURIComponent()")}}
- {{jsxref("escape()")}} {{deprecated_inline}}
- {{jsxref("unescape()")}} {{deprecated_inline}}

### Đối tượng cơ bản

Các đối tượng này đại diện cho các cấu trúc ngôn ngữ cơ bản.

- {{jsxref("Object")}}
- {{jsxref("Function")}}
- {{jsxref("Boolean")}}
- {{jsxref("Symbol")}}

### Đối tượng lỗi

Các đối tượng lỗi là một loại đặc biệt của đối tượng cơ bản. Chúng bao gồm loại {{jsxref("Error")}} cơ bản, cũng như một số loại lỗi chuyên biệt.

- {{jsxref("Error")}}
- {{jsxref("AggregateError")}}
- {{jsxref("EvalError")}}
- {{jsxref("RangeError")}}
- {{jsxref("ReferenceError")}}
- {{jsxref("SuppressedError")}}
- {{jsxref("SyntaxError")}}
- {{jsxref("TypeError")}}
- {{jsxref("URIError")}}
- {{jsxref("InternalError")}} {{non-standard_inline}}

### Số và ngày tháng

Đây là các đối tượng cơ sở đại diện cho số, ngày tháng, và các phép tính toán học.

- {{jsxref("Number")}}
- {{jsxref("BigInt")}}
- {{jsxref("Math")}}
- {{jsxref("Date")}}
- {{jsxref("Temporal")}}

### Xử lý văn bản

Các đối tượng này đại diện cho chuỗi và hỗ trợ thao tác với chúng.

- {{jsxref("String")}}
- {{jsxref("RegExp")}}

### Tập hợp theo chỉ mục

Các đối tượng này đại diện cho các tập hợp dữ liệu được sắp xếp theo giá trị chỉ mục. Điều này bao gồm các mảng (có kiểu) và các cấu trúc giống mảng.

- {{jsxref("Array")}}
- {{jsxref("TypedArray")}}
- {{jsxref("Int8Array")}}
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8ClampedArray")}}
- {{jsxref("Int16Array")}}
- {{jsxref("Uint16Array")}}
- {{jsxref("Int32Array")}}
- {{jsxref("Uint32Array")}}
- {{jsxref("BigInt64Array")}}
- {{jsxref("BigUint64Array")}}
- {{jsxref("Float16Array")}}
- {{jsxref("Float32Array")}}
- {{jsxref("Float64Array")}}

### Tập hợp theo khóa

Các đối tượng này đại diện cho các tập hợp sử dụng khóa. Các tập hợp có thể lặp ({{jsxref("Map")}} và {{jsxref("Set")}}) chứa các phần tử có thể được lặp dễ dàng theo thứ tự chèn.

- {{jsxref("Map")}}
- {{jsxref("Set")}}
- {{jsxref("WeakMap")}}
- {{jsxref("WeakSet")}}

### Dữ liệu có cấu trúc

Các đối tượng này đại diện cho và tương tác với các buffer dữ liệu có cấu trúc và dữ liệu được mã hóa bằng JavaScript Object Notation (JSON).

- {{jsxref("ArrayBuffer")}}
- {{jsxref("SharedArrayBuffer")}}
- {{jsxref("DataView")}}
- {{jsxref("Atomics")}}
- {{jsxref("JSON")}}

### Quản lý bộ nhớ

Các đối tượng này tương tác với cơ chế thu gom rác (garbage collection).

- {{jsxref("WeakRef")}}
- {{jsxref("FinalizationRegistry")}}

### Đối tượng trừu tượng hóa luồng điều khiển

Các trừu tượng hóa luồng điều khiển có thể giúp cấu trúc mã, đặc biệt là mã bất đồng bộ (ví dụ mà không cần sử dụng các callback lồng nhau sâu).

- {{jsxref("Iterator")}}
- {{jsxref("AsyncIterator")}}
- {{jsxref("Promise")}}
- {{jsxref("GeneratorFunction")}}
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("Generator")}}
- {{jsxref("AsyncGenerator")}}
- {{jsxref("AsyncFunction")}}
- {{jsxref("DisposableStack")}}
- {{jsxref("AsyncDisposableStack")}}

### Reflection

- {{jsxref("Reflect")}}
- {{jsxref("Proxy")}}

### Quốc tế hóa

Các bổ sung vào lõi ECMAScript cho các chức năng nhạy cảm với ngôn ngữ.

- {{jsxref("Intl")}}
- {{jsxref("Intl.Collator")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Intl.DisplayNames")}}
- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Intl.ListFormat")}}
- {{jsxref("Intl.Locale")}}
- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Intl.PluralRules")}}
- {{jsxref("Intl.RelativeTimeFormat")}}
- {{jsxref("Intl.Segmenter")}}
