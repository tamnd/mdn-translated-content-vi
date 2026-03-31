---
title: WeakRef
slug: Web/JavaScript/Reference/Global_Objects/WeakRef
page-type: javascript-class
browser-compat: javascript.builtins.WeakRef
sidebar: jsref
---

Đối tượng **`WeakRef`** cho phép bạn giữ một tham chiếu yếu đến một đối tượng khác, mà không ngăn đối tượng đó bị thu gom rác.

## Mô tả

Đối tượng `WeakRef` chứa một tham chiếu yếu đến một đối tượng, được gọi là _target_ hoặc _referent_ của nó. Một _tham chiếu yếu_ đến một đối tượng là một tham chiếu không ngăn đối tượng bị bộ thu gom rác thu hồi. Ngược lại, một tham chiếu thông thường (hay _mạnh_) giữ đối tượng trong bộ nhớ. Khi một đối tượng không còn bất kỳ tham chiếu mạnh nào đến nó, bộ thu gom rác của JavaScript engine có thể hủy đối tượng và thu hồi bộ nhớ của nó. Nếu điều đó xảy ra, bạn không thể lấy lại đối tượng từ một tham chiếu yếu nữa.

Vì [các symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) cũng có thể bị thu gom rác, chúng cũng có thể được dùng làm target của đối tượng `WeakRef`. Tuy nhiên, trường hợp sử dụng này còn hạn chế.

### Tránh sử dụng nếu có thể

Sử dụng đúng `WeakRef` đòi hỏi phải suy nghĩ cẩn thận, và tốt nhất là nên tránh nếu có thể. Điều quan trọng là không dựa vào bất kỳ hành vi cụ thể nào không được đảm bảo bởi đặc tả. Thời điểm, cách thức và liệu việc thu gom rác có xảy ra hay không đều phụ thuộc vào việc triển khai của từng JavaScript engine. Bất kỳ hành vi nào bạn quan sát được trên một engine có thể khác với engine khác, phiên bản khác của cùng một engine, hoặc thậm chí trong một tình huống khác một chút với cùng phiên bản của cùng một engine đó. Thu gom rác là một vấn đề khó mà các nhà phát triển JavaScript engine liên tục tinh chỉnh và cải thiện giải pháp của họ.

Dưới đây là một số điểm cụ thể được các tác giả đưa vào trong [đề xuất](https://github.com/tc39/proposal-weakrefs) đã giới thiệu `WeakRef`:

> [Bộ thu gom rác](<https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)>) rất phức tạp. Nếu một ứng dụng hoặc thư viện phụ thuộc vào GC để dọn dẹp WeakRef hoặc gọi finalizer \[cleanup callback] một cách kịp thời và có thể đoán trước, thì có khả năng sẽ thất vọng: việc dọn dẹp có thể xảy ra muộn hơn nhiều so với dự kiến, hoặc hoàn toàn không xảy ra. Các nguồn biến thiên bao gồm:
>
> - Một đối tượng có thể bị thu gom rác sớm hơn nhiều so với đối tượng khác, ngay cả khi chúng trở nên không thể truy cập cùng một lúc, ví dụ do thu gom theo thế hệ.
> - Công việc thu gom rác có thể được chia nhỏ theo thời gian bằng kỹ thuật tăng dần và đồng thời.
> - Nhiều heuristic runtime khác nhau có thể được sử dụng để cân bằng mức sử dụng bộ nhớ và khả năng phản hồi.
> - JavaScript engine có thể giữ tham chiếu đến những thứ có vẻ không thể truy cập (ví dụ trong closure, hoặc inline cache).
> - Các JavaScript engine khác nhau có thể thực hiện những điều này khác nhau, hoặc cùng một engine có thể thay đổi thuật toán của mình qua các phiên bản.
> - Các yếu tố phức tạp có thể khiến các đối tượng tồn tại lâu hơn dự kiến, chẳng hạn khi sử dụng với một số API nhất định.

### Lưu ý về WeakRef

- Nếu code của bạn vừa tạo một `WeakRef` cho một đối tượng target, hoặc đã lấy một đối tượng target từ phương thức `deref` của `WeakRef`, đối tượng target đó sẽ không bị thu hồi cho đến khi kết thúc [job](https://tc39.es/ecma262/multipage/executable-code-and-execution-contexts.html#job) JavaScript hiện tại (bao gồm bất kỳ promise reaction job nào chạy vào cuối một script job). Nghĩa là bạn chỉ có thể "thấy" một đối tượng bị thu hồi giữa các lượt của event loop. Điều này chủ yếu để tránh làm lộ hành vi của bộ thu gom rác của bất kỳ JavaScript engine nào trong code — vì nếu như vậy, người ta sẽ viết code dựa vào hành vi đó, và code đó sẽ bị hỏng khi hành vi của bộ thu gom rác thay đổi. (Thu gom rác là một vấn đề khó; các nhà phát triển JavaScript engine liên tục tinh chỉnh và cải thiện cách nó hoạt động.)
- Nếu nhiều `WeakRef` có cùng target, chúng nhất quán với nhau. Kết quả của việc gọi `deref` trên một trong số chúng sẽ khớp với kết quả của việc gọi `deref` trên một cái khác (trong cùng một job), bạn sẽ không nhận được đối tượng target từ cái này nhưng lại nhận `undefined` từ cái kia.
- Nếu target của một `WeakRef` cũng ở trong {{jsxref("FinalizationRegistry")}}, target của `WeakRef` sẽ bị xóa cùng lúc hoặc trước khi bất kỳ cleanup callback nào liên kết với registry được gọi; nếu cleanup callback của bạn gọi `deref` trên một `WeakRef` cho đối tượng đó, nó sẽ nhận được `undefined`.
- Bạn không thể thay đổi target của một `WeakRef`, nó sẽ luôn chỉ là đối tượng target ban đầu hoặc `undefined` khi target đó đã bị thu hồi.
- Một `WeakRef` có thể không bao giờ trả về `undefined` từ `deref`, ngay cả khi không có gì giữ target một cách mạnh, vì bộ thu gom rác có thể không bao giờ quyết định thu hồi đối tượng đó.

## Constructor

- {{jsxref("WeakRef/WeakRef", "WeakRef()")}}
  - : Tạo một đối tượng `WeakRef` mới.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `WeakRef.prototype` và được chia sẻ bởi tất cả các instance của `WeakRef`.

- {{jsxref("Object/constructor", "WeakRef.prototype.constructor")}} {{optional_inline}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `WeakRef`, giá trị ban đầu là constructor {{jsxref("WeakRef/WeakRef", "WeakRef")}}.

    > [!NOTE]
    > Thuộc tính này được đánh dấu là "normative optional" trong đặc tả, có nghĩa là một implementation tuân thủ có thể không cung cấp thuộc tính `constructor`. Điều này ngăn code tùy ý lấy được constructor `WeakRef` và có khả năng quan sát việc thu gom rác. Tuy nhiên, tất cả các engine lớn đều cung cấp nó theo mặc định.

- `WeakRef.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"WeakRef"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("WeakRef.prototype.deref()")}}
  - : Trả về đối tượng target của đối tượng `WeakRef`, hoặc `undefined` nếu đối tượng target đã bị thu hồi.

## Ví dụ

### Sử dụng đối tượng WeakRef

Ví dụ này khởi động một bộ đếm hiển thị trong một phần tử DOM, dừng lại khi phần tử đó không còn tồn tại nữa:

```js
class Counter {
  constructor(element) {
    // Remember a weak reference to the DOM element
    this.ref = new WeakRef(element);
    this.start();
  }

  start() {
    if (this.timer) {
      return;
    }

    this.count = 0;

    const tick = () => {
      // Get the element from the weak reference, if it still exists
      const element = this.ref.deref();
      if (element) {
        element.textContent = ++this.count;
      } else {
        // The element doesn't exist anymore
        console.log("The element is gone.");
        this.stop();
        this.ref = null;
      }
    };

    tick();
    this.timer = setInterval(tick, 1000);
  }

  stop() {
    if (this.timer) {
      clearInterval(this.timer);
      this.timer = 0;
    }
  }
}

const counter = new Counter(document.getElementById("counter"));
setTimeout(() => {
  document.getElementById("counter").remove();
}, 5000);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("FinalizationRegistry")}}
- {{jsxref("WeakSet")}}
- {{jsxref("WeakMap")}}
