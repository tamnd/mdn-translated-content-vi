---
title: FinalizationRegistry
slug: Web/JavaScript/Reference/Global_Objects/FinalizationRegistry
page-type: javascript-class
browser-compat: javascript.builtins.FinalizationRegistry
sidebar: jsref
---

Đối tượng **`FinalizationRegistry`** cho phép bạn yêu cầu một callback khi một giá trị bị thu gom rác.

## Mô tả

`FinalizationRegistry` cung cấp một cách để yêu cầu rằng một _cleanup callback_ sẽ được gọi vào một thời điểm nào đó khi một giá trị được đăng ký với registry đã bị _thu hồi_ (garbage-collected). (Cleanup callback đôi khi được gọi là _finalizer_.)

> [!NOTE]
> Cleanup callback không nên được sử dụng cho logic chương trình thiết yếu. Xem [Lưu ý về cleanup callback](#lưu_ý_về_cleanup_callback) để biết thêm chi tiết.

Bạn tạo registry bằng cách truyền vào callback:

```js
const registry = new FinalizationRegistry((heldValue) => {
  // …
});
```

Sau đó bạn đăng ký bất kỳ giá trị nào bạn muốn có cleanup callback bằng cách gọi phương thức `register`, truyền vào giá trị đó và một _held value_ cho nó:

```js
registry.register(target, "some value");
```

Registry không giữ tham chiếu mạnh đến giá trị, vì điều đó sẽ phủ nhận mục đích (nếu registry giữ nó một cách mạnh, giá trị sẽ không bao giờ bị thu hồi). Trong JavaScript, các đối tượng và [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) có thể bị thu gom rác, vì vậy chúng có thể được đăng ký trong đối tượng `FinalizationRegistry` làm target hoặc token.

Nếu `target` bị thu hồi, cleanup callback của bạn có thể được gọi vào một thời điểm nào đó với _held value_ bạn đã cung cấp cho nó (`"some value"` trong ví dụ trên). Held value có thể là bất kỳ giá trị nào bạn muốn: một giá trị nguyên thủy hoặc một đối tượng, thậm chí là `undefined`. Nếu held value là một đối tượng, registry giữ một tham chiếu _mạnh_ đến nó (để có thể truyền nó vào cleanup callback sau này).

Nếu bạn muốn hủy đăng ký một giá trị target đã đăng ký sau này, bạn truyền một giá trị thứ ba, đó là _unregistration token_ bạn sẽ dùng sau này khi gọi hàm `unregister` của registry để hủy đăng ký giá trị đó. Registry chỉ giữ tham chiếu yếu đến unregister token.

Thông thường, người ta dùng chính giá trị target làm unregister token, điều này hoàn toàn ổn:

```js
registry.register(target, "some value", target);
// …

// some time later, if you don't care about `target` anymore, unregister it
registry.unregister(target);
```

Tuy nhiên, không nhất thiết phải là cùng một giá trị; nó có thể là một giá trị khác:

```js
registry.register(target, "some value", token);
// …

// some time later
registry.unregister(token);
```

### Tránh sử dụng nếu có thể

Sử dụng đúng `FinalizationRegistry` đòi hỏi phải suy nghĩ cẩn thận, và tốt nhất là nên tránh nếu có thể. Điều quan trọng là không dựa vào bất kỳ hành vi cụ thể nào không được đảm bảo bởi đặc tả. Thời điểm, cách thức và liệu việc thu gom rác có xảy ra hay không đều phụ thuộc vào việc triển khai của từng JavaScript engine. Bất kỳ hành vi nào bạn quan sát được trên một engine có thể khác với engine khác, phiên bản khác của cùng một engine, hoặc thậm chí trong một tình huống khác một chút với cùng phiên bản của cùng một engine đó. Thu gom rác là một vấn đề khó mà các nhà phát triển JavaScript engine liên tục tinh chỉnh và cải thiện giải pháp của họ.

Dưới đây là một số điểm cụ thể được các tác giả đưa vào trong [đề xuất](https://github.com/tc39/proposal-weakrefs) đã giới thiệu `FinalizationRegistry`:

> [Bộ thu gom rác](<https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)>) rất phức tạp. Nếu một ứng dụng hoặc thư viện phụ thuộc vào GC để dọn dẹp WeakRef hoặc gọi finalizer \[cleanup callback] một cách kịp thời và có thể đoán trước, thì có khả năng sẽ thất vọng: việc dọn dẹp có thể xảy ra muộn hơn nhiều so với dự kiến, hoặc hoàn toàn không xảy ra. Các nguồn biến thiên bao gồm:
>
> - Một đối tượng có thể bị thu gom rác sớm hơn nhiều so với đối tượng khác, ngay cả khi chúng trở nên không thể truy cập cùng một lúc, ví dụ do thu gom theo thế hệ.
> - Công việc thu gom rác có thể được chia nhỏ theo thời gian bằng kỹ thuật tăng dần và đồng thời.
> - Nhiều heuristic runtime khác nhau có thể được sử dụng để cân bằng mức sử dụng bộ nhớ và khả năng phản hồi.
> - JavaScript engine có thể giữ tham chiếu đến những thứ có vẻ không thể truy cập (ví dụ trong closure, hoặc inline cache).
> - Các JavaScript engine khác nhau có thể thực hiện những điều này khác nhau, hoặc cùng một engine có thể thay đổi thuật toán của mình qua các phiên bản.
> - Các yếu tố phức tạp có thể khiến các đối tượng tồn tại lâu hơn dự kiến, chẳng hạn khi sử dụng với một số API nhất định.

### Lưu ý về cleanup callback

- Các nhà phát triển không nên dựa vào cleanup callback cho logic chương trình thiết yếu. Cleanup callback có thể hữu ích để giảm mức sử dụng bộ nhớ trong suốt vòng đời của chương trình, nhưng không có khả năng hữu ích trong các trường hợp khác.
- Nếu code của bạn vừa đăng ký một giá trị vào registry, target đó sẽ không bị thu hồi cho đến khi kết thúc [job](https://tc39.es/ecma262/multipage/executable-code-and-execution-contexts.html#job) JavaScript hiện tại. Xem [lưu ý về WeakRef](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef#notes_on_weakrefs) để biết thêm chi tiết.
- Một JavaScript implementation tuân thủ, ngay cả khi có thu gom rác, không bắt buộc phải gọi cleanup callback. Thời điểm và liệu nó có làm vậy hay không hoàn toàn phụ thuộc vào việc triển khai của JavaScript engine. Khi một đối tượng đã đăng ký bị thu hồi, bất kỳ cleanup callback nào cho nó có thể được gọi vào thời điểm đó, hay một thời điểm nào đó sau này, hoặc hoàn toàn không.
- Có khả năng các implementation lớn sẽ gọi cleanup callback vào một thời điểm nào đó trong quá trình thực thi, nhưng những lần gọi đó có thể xảy ra khá lâu sau khi đối tượng liên quan bị thu hồi. Hơn nữa, nếu có một đối tượng được đăng ký trong hai registry, không có gì đảm bảo rằng hai callback được gọi kề nhau — một cái có thể được gọi còn cái kia không bao giờ được gọi, hoặc cái kia có thể được gọi muộn hơn nhiều.
- Cũng có những tình huống mà ngay cả các implementation thường gọi cleanup callback cũng không có khả năng gọi chúng:
  - Khi chương trình JavaScript tắt hoàn toàn (ví dụ khi đóng một tab trong trình duyệt).
  - Khi bản thân instance `FinalizationRegistry` không còn có thể truy cập bởi code JavaScript.
- Nếu target của một `WeakRef` cũng ở trong một `FinalizationRegistry`, target của `WeakRef` sẽ bị xóa cùng lúc hoặc trước khi bất kỳ cleanup callback nào liên kết với registry được gọi; nếu cleanup callback của bạn gọi `deref` trên một `WeakRef` cho đối tượng đó, nó sẽ nhận được `undefined`.

## Constructor

- {{jsxref("FinalizationRegistry/FinalizationRegistry", "FinalizationRegistry()")}}
  - : Tạo một đối tượng `FinalizationRegistry` mới.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `FinalizationRegistry.prototype` và được chia sẻ bởi tất cả các instance của `FinalizationRegistry`.

- {{jsxref("Object/constructor", "FinalizationRegistry.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `FinalizationRegistry`, giá trị ban đầu là constructor {{jsxref("FinalizationRegistry/FinalizationRegistry", "FinalizationRegistry")}}.
- `FinalizationRegistry.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"FinalizationRegistry"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("FinalizationRegistry.prototype.register()")}}
  - : Đăng ký một đối tượng với registry để nhận cleanup callback khi/nếu đối tượng đó bị thu gom rác.
- {{jsxref("FinalizationRegistry.prototype.unregister()")}}
  - : Hủy đăng ký một đối tượng khỏi registry.

## Ví dụ

### Tạo một registry mới

Bạn tạo registry bằng cách truyền vào callback:

```js
const registry = new FinalizationRegistry((heldValue) => {
  // …
});
```

### Đăng ký đối tượng để dọn dẹp

Sau đó bạn đăng ký bất kỳ đối tượng nào bạn muốn có cleanup callback bằng cách gọi phương thức `register`, truyền vào đối tượng đó và một _held value_ cho nó:

```js
registry.register(theObject, "some value");
```

### Callback không bao giờ được gọi đồng bộ

Dù bạn gây áp lực bộ thu gom rác bao nhiêu, cleanup callback sẽ không bao giờ được gọi đồng bộ. Đối tượng có thể bị thu hồi đồng bộ, nhưng callback sẽ luôn được gọi vào một thời điểm nào đó sau khi job hiện tại kết thúc:

```js
let counter = 0;
const registry = new FinalizationRegistry(() => {
  console.log(`Array gets garbage collected at ${counter}`);
});

registry.register(["foo"]);

(function allocateMemory() {
  // Allocate 50000 functions — a lot of memory!
  Array.from({ length: 50000 }, () => () => {});
  if (counter > 5000) return;
  counter++;
  allocateMemory();
})();

console.log("Main job ends");
// Logs:
// Main job ends
// Array gets garbage collected at 5001
```

Tuy nhiên, nếu bạn cho phép một khoảng nghỉ nhỏ giữa mỗi lần phân bổ, callback có thể được gọi sớm hơn:

```js
let arrayCollected = false;
let counter = 0;
const registry = new FinalizationRegistry(() => {
  console.log(`Array gets garbage collected at ${counter}`);
  arrayCollected = true;
});

registry.register(["foo"]);

(function allocateMemory() {
  // Allocate 50000 functions — a lot of memory!
  Array.from({ length: 50000 }, () => () => {});
  if (counter > 5000 || arrayCollected) return;
  counter++;
  // Use setTimeout to make each allocateMemory a different job
  setTimeout(allocateMemory);
})();

console.log("Main job ends");
```

Không có gì đảm bảo rằng callback sẽ được gọi sớm hơn hoặc liệu nó có được gọi hay không, nhưng có khả năng thông điệp được log ra có giá trị counter nhỏ hơn 5000.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("WeakRef")}}
- {{jsxref("WeakSet")}}
- {{jsxref("WeakMap")}}
