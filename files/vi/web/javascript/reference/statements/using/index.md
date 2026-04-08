---
title: using
slug: Web/JavaScript/Reference/Statements/using
page-type: javascript-statement
browser-compat: javascript.statements.using
sidebar: jssidebar
---

Khai báo **`using`** khai báo các biến cục bộ có phạm vi khối được _giải phóng đồng bộ_. Giống như {{jsxref("Statements/const", "const")}}, các biến được khai báo với `using` phải được khởi tạo và không thể được gán lại. Giá trị của biến phải là `null`, `undefined`, hoặc một đối tượng có phương thức [`[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/dispose). Khi biến ra khỏi phạm vi, phương thức `[Symbol.dispose]()` của đối tượng được gọi, để đảm bảo rằng các tài nguyên được giải phóng.

## Cú pháp

```js-nolint
using name1 = value1;
using name1 = value1, name2 = value2;
using name1 = value1, name2 = value2, /* …, */ nameN = valueN;
```

- `nameN`
  - : Tên của biến cần khai báo. Mỗi tên phải là một [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript hợp lệ và _không_ phải là một [mẫu ràng buộc destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).
- `valueN`
  - : Giá trị ban đầu của biến. Có thể là bất kỳ biểu thức hợp lệ nào nhưng giá trị của nó phải là `null`, `undefined`, hoặc một đối tượng có phương thức `[Symbol.dispose]()`.

## Mô tả

Khai báo này có thể được sử dụng:

- Bên trong một [khối lệnh](/en-US/docs/Web/JavaScript/Reference/Statements/block)
- Bên trong bất kỳ [thân hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function) hoặc [khối khởi tạo static của class](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)
- Ở cấp độ cao nhất của một [module](/en-US/docs/Web/JavaScript/Guide/Modules)
- Trong phần khởi tạo của vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for), [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), hoặc [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of)

Đáng chú ý nhất, nó không thể được sử dụng:

- Ở cấp độ cao nhất của một script, vì phạm vi script là liên tục.
- Ở cấp độ cao nhất của một câu lệnh [`switch`](/en-US/docs/Web/JavaScript/Reference/Statements/switch).
- Trong phần khởi tạo của vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in). Vì biến vòng lặp chỉ có thể là một string hoặc symbol, điều này không có ý nghĩa.

`using` khai báo một tài nguyên có thể giải phóng được gắn với thời gian tồn tại của phạm vi biến (khối lệnh, hàm, module, v.v.). Khi phạm vi kết thúc, tài nguyên được giải phóng đồng bộ. Biến được phép có giá trị `null` hoặc `undefined`, do đó tài nguyên có thể tùy chọn có mặt.

Khi biến được khai báo lần đầu và giá trị của nó khác null, một _disposer_ được lấy từ đối tượng. Nếu thuộc tính `[Symbol.dispose]` không chứa một hàm, một `TypeError` sẽ được ném ra. Disposer này được lưu vào phạm vi.

Khi biến ra khỏi phạm vi, disposer được gọi. Nếu phạm vi chứa nhiều khai báo `using` hoặc {{jsxref("Statements/await_using", "await using")}}, tất cả các disposer sẽ chạy theo thứ tự ngược lại của khai báo, bất kể loại khai báo. Tất cả các disposer đều được đảm bảo chạy (giống như khối `finally` trong {{jsxref("Statements/try...catch", "try...catch...finally")}}). Tất cả các lỗi xảy ra trong quá trình giải phóng, bao gồm cả lỗi ban đầu khiến phạm vi kết thúc (nếu có), đều được tổng hợp trong một {{jsxref("SuppressedError")}}, với mỗi ngoại lệ trước đó là thuộc tính `suppressed` và ngoại lệ sau là thuộc tính `error`. `SuppressedError` này được ném ra sau khi việc giải phóng hoàn tất.

`using` gắn việc quản lý tài nguyên với các phạm vi từ vựng, vừa tiện lợi vừa đôi khi gây nhầm lẫn. Có nhiều cách để giữ giá trị của biến khi chính biến đó đã ra khỏi phạm vi, vì vậy bạn có thể giữ một tham chiếu đến một tài nguyên đã bị giải phóng. Xem bên dưới để biết một số ví dụ mà nó có thể không hoạt động như bạn mong đợi. Nếu bạn muốn quản lý việc giải phóng tài nguyên thủ công, trong khi vẫn duy trì các đảm bảo xử lý lỗi tương tự, bạn có thể sử dụng {{jsxref("DisposableStack")}} thay thế.

## Ví dụ

Trong các ví dụ sau, chúng ta giả sử một class `Resource` đơn giản có phương thức `getValue` và phương thức `[Symbol.dispose]()`:

```js
class Resource {
  value = Math.random();
  #isDisposed = false;

  getValue() {
    if (this.#isDisposed) {
      throw new Error("Resource is disposed");
    }
    return this.value;
  }

  [Symbol.dispose]() {
    this.#isDisposed = true;
    console.log("Resource disposed");
  }
}
```

### `using` trong một khối lệnh

Tài nguyên được khai báo với `using` được giải phóng khi thoát khỏi khối lệnh.

```js
{
  using resource = new Resource();
  console.log(resource.getValue());
  // resource được giải phóng ở đây
}
```

### `using` trong một hàm

Bạn có thể sử dụng `using` trong thân hàm. Trong trường hợp này, tài nguyên được giải phóng khi hàm hoàn thành thực thi, ngay trước khi hàm trả về.

```js
function example() {
  using resource = new Resource();
  return resource.getValue();
}
```

Ở đây, `resource[Symbol.dispose]()` sẽ được gọi sau `getValue()`, trước khi câu lệnh `return` thực thi.

Tài nguyên có thể tồn tại lâu hơn khai báo, trong trường hợp nó được nắm bắt bởi một [closure](/en-US/docs/Web/JavaScript/Guide/Closures):

```js
function example() {
  using resource = new Resource();
  return () => resource.getValue();
}
```

Trong trường hợp này, nếu bạn gọi `example()()`, bạn sẽ luôn thực thi `getValue` trên một tài nguyên đã bị giải phóng, vì tài nguyên đã bị giải phóng khi `example` trả về. Trong trường hợp bạn muốn giải phóng tài nguyên ngay sau khi callback được gọi một lần, hãy xem xét mẫu này:

```js
function example() {
  const resource = new Resource();
  return () => {
    using resource2 = resource;
    return resource2.getValue();
  };
}
```

Ở đây, chúng ta _đặt bí danh_ cho một tài nguyên được khai báo với `const` thành một tài nguyên được khai báo với `using`, để tài nguyên chỉ được giải phóng sau khi callback được gọi; lưu ý rằng nếu nó không bao giờ được gọi thì tài nguyên sẽ không bao giờ được dọn dẹp.

### `using` trong một module

Bạn có thể sử dụng `using` ở cấp độ cao nhất của một module. Trong trường hợp này, tài nguyên được giải phóng khi module hoàn thành thực thi.

```js
using resource = new Resource();
export const value = resource.getValue();
// resource được giải phóng ở đây
```

`export using` là cú pháp không hợp lệ, nhưng bạn có thể `export` một biến được khai báo ở nơi khác bằng `using`:

```js
using resource = new Resource();
export { resource };
```

Điều này vẫn không được khuyến khích, vì người nhập sẽ luôn nhận được một tài nguyên đã bị giải phóng. Tương tự như vấn đề closure, điều này khiến giá trị của tài nguyên tồn tại lâu hơn biến.

### `using` với `for...of`

Bạn có thể sử dụng `using` trong phần khởi tạo của vòng lặp `for...of`. Trong trường hợp này, tài nguyên được giải phóng trong mỗi vòng lặp.

```js
const resources = [new Resource(), new Resource(), new Resource()];
for (using resource of resources) {
  console.log(resource.getValue());
  // resource được giải phóng ở đây
}
```

### Nhiều `using`

Sau đây là hai cách tương đương để khai báo nhiều tài nguyên có thể giải phóng:

```js
using resource1 = new Resource(),
  resource2 = new Resource();

// HOẶC

using resource1 = new Resource();
using resource2 = new Resource();
```

Trong cả hai trường hợp, khi phạm vi kết thúc, `resource2` được giải phóng trước `resource1`. Điều này là vì `resource2` có thể phụ thuộc vào `resource1`, vì vậy nó được giải phóng trước để đảm bảo rằng `resource1` vẫn khả dụng khi `resource2` được giải phóng.

### `using` tùy chọn

`using` cho phép biến có giá trị `null` hoặc `undefined`, do đó tài nguyên có thể tùy chọn có mặt. Điều này có nghĩa là, ví dụ, nếu bạn đang kiểm tra tính khả dụng của một tài nguyên nào đó:

```js
function acquireResource() {
  // Hãy tưởng tượng một điều kiện thực tế liên quan ở đây,
  // chẳng hạn như liệu có không gian để phân bổ cho tài nguyên này không
  if (Math.random() < 0.5) {
    return null;
  }
  return new Resource();
}
```

Bạn không cần phải làm điều này:

```js example-bad
const maybeResource = acquireResource();

if (maybeResource) {
  using resource = maybeResource;
  console.log(resource.getValue());
} else {
  console.log(undefined);
}
```

Và có thể làm điều này thay thế:

```js example-good
using resource = acquireResource();
console.log(resource?.getValue());
```

### Khai báo `using` mà không dùng biến

Bạn có thể thực hiện giải phóng tài nguyên tự động bằng `using`, mà không cần sử dụng biến. Điều này rất hữu ích để thiết lập một ngữ cảnh trong một khối lệnh, chẳng hạn như tạo một lock:

```js
{
  using _ = new Lock();
  // Thực hiện các thao tác đồng thời ở đây
  // Lock được giải phóng (released) ở đây
}
```

Lưu ý rằng `_` là một identifier bình thường, nhưng theo quy ước sử dụng nó như một biến "dùng một lần". Để tạo nhiều biến không sử dụng, bạn cần sử dụng các tên khác nhau, ví dụ bằng cách sử dụng tên biến có tiền tố `_`.

### Khởi tạo và vùng chết tạm thời

Các biến `using` phải chịu cùng hạn chế [vùng chết tạm thời](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz) như các biến `let` và `const`. Điều này có nghĩa là bạn không thể truy cập biến trước khi khởi tạo — thời gian tồn tại hợp lệ của tài nguyên là chính xác từ lúc khởi tạo đến cuối phạm vi của nó. Điều này cho phép quản lý tài nguyên theo kiểu [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization).

```js
let useResource;
{
  useResource = () => resource.getValue();
  useResource(); // Error: Cannot access 'resource' before initialization
  using resource = new Resource();
  useResource(); // Hợp lệ
}
useResource(); // Error: Resource is disposed
```

### Xử lý lỗi

Khai báo `using` hữu ích nhất cho việc quản lý giải phóng tài nguyên khi có lỗi. Nếu bạn không cẩn thận, một số tài nguyên có thể bị rò rỉ vì lỗi ngăn code tiếp theo thực thi.

```js
function handleResource(resource) {
  if (resource.getValue() > 0.5) {
    throw new Error("Resource value too high");
  }
}

try {
  using resource = new Resource();
  handleResource(resource);
} catch (e) {
  console.error(e);
}
```

Điều này sẽ bắt lỗi ném ra bởi `handleResource` và ghi lại nó một cách thành công, và dù `handleResource` có ném lỗi hay không, tài nguyên đều được giải phóng trước khi thoát khỏi khối `try`.

Ở đây, nếu bạn không sử dụng `using`, bạn có thể làm điều gì đó như:

```js example-bad
try {
  const resource = new Resource();
  handleResource(resource);
  resource[Symbol.dispose]();
} catch (e) {
  console.error(e);
}
```

Nhưng, nếu `handleResource()` ném lỗi, thì luồng điều khiển không bao giờ đến `resource[Symbol.dispose]()`, và tài nguyên bị rò rỉ. Hơn nữa, nếu bạn có hai tài nguyên, thì lỗi ném ra trong các lần giải phóng trước đó có thể ngăn các lần giải phóng sau chạy, dẫn đến nhiều rò rỉ hơn.

Hãy xem xét một trường hợp phức tạp hơn khi bản thân disposer ném lỗi:

```js
class CantDisposeMe {
  #name;
  constructor(name) {
    this.#name = name;
  }
  [Symbol.dispose]() {
    throw new Error(`Can't dispose ${this.#name}`);
  }
}

let error;

try {
  using resource1 = new CantDisposeMe("resource1");
  using resource2 = new CantDisposeMe("resource2");
  throw new Error("Error in main block");
} catch (e) {
  error = e;
}
```

Bạn có thể kiểm tra lỗi ném ra trong console của trình duyệt. Nó có cấu trúc sau:

```plain
SuppressedError: An error was suppressed during disposal
  suppressed: SuppressedError: An error was suppressed during disposal
    suppressed: Error: Can't dispose resource1
    error: Error: Error in main block
  error: Error: Can't dispose resource2
```

Như bạn có thể thấy, `error` chứa tất cả các lỗi đã ném ra trong quá trình giải phóng, như một {{jsxref("SuppressedError")}}. Mỗi lỗi bổ sung được thêm vào như thuộc tính `error`, và lỗi gốc được thêm vào như thuộc tính `suppressed`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/await_using", "await using")}}
- {{jsxref("Symbol.dispose")}}
- {{jsxref("DisposableStack")}}
