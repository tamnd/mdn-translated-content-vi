---
title: Prioritized Task Scheduling API
slug: Web/API/Prioritized_Task_Scheduling_API
page-type: web-api-overview
browser-compat:
  - api.Scheduler
  - api.Scheduling
---

{{DefaultAPISidebar("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

**Prioritized Task Scheduling API** cung cấp một cách chuẩn hóa để ưu tiên tất cả các tác vụ thuộc về một ứng dụng, bất kể chúng được xác định trong mã của nhà phát triển website hay trong các thư viện và framework bên thứ ba.

[Độ ưu tiên tác vụ](#task_priorities) rất thô và dựa trên việc tác vụ có chặn tương tác của người dùng hay ảnh hưởng đến trải nghiệm người dùng, hoặc có thể chạy ở nền. Nhà phát triển và framework có thể triển khai các cơ chế ưu tiên chi tiết hơn bên trong các nhóm rộng mà API này định nghĩa.

API này dựa trên promise và hỗ trợ khả năng đặt và thay đổi độ ưu tiên của tác vụ, trì hoãn các tác vụ được thêm vào scheduler, hủy tác vụ, và theo dõi các sự kiện thay đổi độ ưu tiên cũng như hủy.

## Khái niệm và cách dùng

Prioritized Task Scheduling API có sẵn ở cả window và worker thread thông qua thuộc tính `scheduler` trên đối tượng global.

Các phương thức chính của API là {{domxref('scheduler.postTask()')}} và {{domxref('scheduler.yield()')}}. `scheduler.postTask()` nhận một hàm callback (tác vụ) và trả về một promise sẽ resolve với giá trị trả về của hàm hoặc reject với lỗi. `scheduler.yield()` biến bất kỳ hàm [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) nào thành một tác vụ bằng cách nhường luồng chính cho trình duyệt để thực hiện công việc khác, rồi tiếp tục khi promise trả về được resolve.

Hai phương thức này có chức năng tương tự nhưng mức độ điều khiển khác nhau. `scheduler.postTask()` có nhiều tùy chọn hơn - chẳng hạn, nó cho phép đặt rõ ràng độ ưu tiên của tác vụ và hủy tác vụ thông qua [`AbortSignal`](/en-US/docs/Web/API/AbortSignal). Ngược lại, `scheduler.yield()` đơn giản hơn và có thể `await` trong bất kỳ hàm `async` nào mà không cần cung cấp một tác vụ tiếp theo ở hàm khác.

### `scheduler.yield()`

Để chia nhỏ các tác vụ JavaScript chạy dài để chúng không chặn luồng chính, hãy chèn một lệnh gọi `scheduler.yield()` để tạm thời trả luồng chính lại cho trình duyệt, tạo ra một tác vụ tiếp tục thực thi từ chỗ đã dừng.

```js
async function slowTask() {
  firstHalfOfWork();
  await scheduler.yield();
  secondHalfOfWork();
}
```

`scheduler.yield()` trả về một promise có thể `await` để tiếp tục thực thi. Điều này cho phép phần việc thuộc cùng một hàm được giữ ở đó, mà không chặn luồng chính khi hàm chạy.

`scheduler.yield()` không nhận đối số. Tác vụ kích hoạt phần tiếp tục của nó có độ ưu tiên mặc định là [`user-visible`](#user-visible); tuy nhiên, nếu `scheduler.yield()` được gọi bên trong một callback của `scheduler.postTask()`, nó sẽ [kế thừa độ ưu tiên của tác vụ bao quanh](/en-US/docs/Web/API/Scheduler/yield#inheriting_task_priorities).

### `scheduler.postTask()`

Khi `scheduler.postTask()` được gọi mà không có đối số, nó tạo ra một tác vụ với độ ưu tiên mặc định [`user-visible`](#user-visible) và không thể bị hủy hay thay đổi độ ưu tiên.

```js
const promise = scheduler.postTask(myTask);
```

Vì phương thức này trả về một promise, bạn có thể chờ nó resolve bất đồng bộ bằng [`then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then), và bắt các lỗi do hàm callback của tác vụ ném ra (hoặc khi tác vụ bị hủy) bằng [`catch`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch). Hàm callback có thể là bất kỳ kiểu hàm nào (bên dưới chúng tôi minh họa bằng một arrow function).

```js
scheduler
  .postTask(() => "Task executing")
  // Promise được resolve: ghi lại kết quả tác vụ khi promise resolve
  .then((taskResult) => console.log(`${taskResult}`))
  // Promise bị reject: ghi lại AbortError hoặc lỗi do tác vụ ném ra
  .catch((error) => console.error(`Error: ${error}`));
```

Bạn cũng có thể chờ cùng tác vụ đó bằng `await`/`async` như dưới đây (lưu ý, ví dụ này được chạy trong một {{Glossary("IIFE", "Immediately Invoked Function Expression (IIFE)")}}):

```js
(async () => {
  try {
    const result = await scheduler.postTask(() => "Task executing");
    console.log(result);
  } catch (error) {
    // Ghi lại AbortError hoặc lỗi do hàm tác vụ ném ra
    console.error(`Error: ${error}`);
  }
})();
```

Bạn cũng có thể chỉ định một đối tượng tùy chọn cho phương thức `postTask()` nếu muốn thay đổi hành vi mặc định.
Các tùy chọn là:

- `priority` Cho phép bạn chỉ định một độ ưu tiên bất biến cụ thể.
  Khi đã được đặt, độ ưu tiên này không thể thay đổi.
- `signal` Cho phép bạn chỉ định một signal, có thể là {{domxref("TaskSignal")}} hoặc {{domxref("AbortSignal")}}
  Signal này được liên kết với một controller, có thể được dùng để hủy tác vụ.
  {{domxref("TaskSignal")}} cũng có thể được dùng để đặt và thay đổi độ ưu tiên của tác vụ nếu [tác vụ có thể thay đổi](#mutable_and_immutable_task_priority).
- `delay` Cho phép bạn chỉ định độ trễ trước khi tác vụ được thêm vào để lên lịch, tính bằng mili giây.

Ví dụ tương tự như trên nhưng có tùy chọn độ ưu tiên sẽ như sau:

```js
scheduler
  .postTask(() => "Task executing", { priority: "user-blocking" })
  .then((taskResult) => console.log(`${taskResult}`)) // Ghi lại kết quả tác vụ
  .catch((error) => console.error(`Error: ${error}`)); // Ghi lại mọi lỗi
```

### Độ ưu tiên tác vụ

Các tác vụ đã lên lịch được chạy theo thứ tự ưu tiên, sau đó đến thứ tự chúng được thêm vào hàng đợi của scheduler.

Chỉ có ba mức ưu tiên, được liệt kê bên dưới theo thứ tự từ cao đến thấp:

- `user-blocking`
  - : Các tác vụ ngăn người dùng tương tác với trang.
    Điều này bao gồm việc hiển thị trang đến mức có thể sử dụng được, hoặc phản hồi đầu vào của người dùng.

- `user-visible`
  - : Các tác vụ hiển thị với người dùng nhưng không nhất thiết chặn hành động của người dùng.
    Điều này có thể bao gồm việc hiển thị các phần không thiết yếu của trang, chẳng hạn như hình ảnh hoặc hoạt ảnh không thiết yếu.

    Đây là độ ưu tiên mặc định cho `scheduler.postTask()` và `scheduler.yield()`.

- `background`
  - : Các tác vụ không mang tính thời gian thực.
    Điều này có thể bao gồm xử lý log hoặc khởi tạo các thư viện bên thứ ba không cần cho việc hiển thị.

### Độ ưu tiên tác vụ có thể thay đổi và bất biến

Có nhiều trường hợp độ ưu tiên của tác vụ không bao giờ cần thay đổi, nhưng cũng có những trường hợp khác thì có.
Ví dụ, việc tìm nạp một hình ảnh có thể chuyển từ tác vụ `background` sang `user-visible` khi carousel được cuộn vào vùng hiển thị.

Độ ưu tiên của tác vụ có thể được đặt là tĩnh (bất biến) hoặc động (có thể sửa đổi) tùy theo các đối số được truyền vào {{domxref('Scheduler.postTask()')}}.

Độ ưu tiên của tác vụ là bất biến nếu một giá trị được chỉ định trong đối số `options.priority`.
Giá trị được cung cấp sẽ được dùng làm độ ưu tiên của tác vụ và không thể thay đổi.

Độ ưu tiên chỉ có thể sửa đổi nếu một {{domxref("TaskSignal")}} được truyền vào đối số `options.signal` **và** `options.priority` **không được đặt**.
Trong trường hợp này, tác vụ sẽ lấy độ ưu tiên ban đầu từ độ ưu tiên của `signal`, và độ ưu tiên này có thể được thay đổi sau đó bằng cách gọi {{domxref("TaskController.setPriority()")}} trên controller liên kết với signal.

Nếu độ ưu tiên không được đặt bằng `options.priority` hoặc bằng cách truyền một {{domxref("TaskSignal")}} vào `options.signal` thì mặc định là `user-visible` (và theo định nghĩa là bất biến).

Lưu ý rằng một tác vụ cần bị hủy phải đặt `options.signal` thành {{domxref("TaskSignal")}} hoặc {{domxref("AbortSignal")}}.
Tuy nhiên, với tác vụ có độ ưu tiên bất biến, {{domxref("AbortSignal")}} thể hiện rõ hơn rằng độ ưu tiên của tác vụ không thể bị thay đổi bằng signal.

Hãy đi qua một ví dụ để minh họa ý nghĩa của điều này. Khi bạn có nhiều tác vụ có độ ưu tiên xấp xỉ như nhau, việc tách chúng thành các hàm riêng là hợp lý để thuận tiện cho bảo trì, gỡ lỗi và nhiều lý do khác.

Ví dụ:

```js
function main() {
  a();
  b();
  c();
  d();
  e();
}
```

Tuy nhiên, kiểu cấu trúc này không giúp tránh chặn luồng chính. Vì cả năm tác vụ đều chạy bên trong một hàm main, trình duyệt sẽ chạy tất cả chúng như một tác vụ duy nhất.

Để xử lý điều này, ta thường chạy một hàm định kỳ để cho mã _nhường lại cho luồng chính_. Điều này có nghĩa là mã của chúng ta được chia thành nhiều tác vụ, giữa các lần thực thi của chúng trình duyệt có cơ hội xử lý các tác vụ ưu tiên cao như cập nhật giao diện. Một mẫu phổ biến cho hàm này dùng {{domxref("Window.setTimeout", "setTimeout()")}} để trì hoãn thực thi sang một tác vụ riêng:

```js
function yield() {
  return new Promise((resolve) => {
    setTimeout(resolve, 0);
  });
}
```

Bạn có thể dùng nó bên trong một mẫu task runner như sau, để nhường lại cho luồng chính sau khi mỗi tác vụ được chạy:

```js
async function main() {
  // Tạo một mảng các hàm cần chạy
  const tasks = [a, b, c, d, e];

  // Lặp qua các tác vụ
  while (tasks.length > 0) {
    // Lấy tác vụ đầu tiên ra khỏi mảng tasks
    const task = tasks.shift();

    // Chạy tác vụ
    task();

    // Nhường lại cho luồng chính
    await yield();
  }
}
```

Để cải thiện thêm, chúng ta có thể dùng {{domxref("Scheduler.yield")}} khi có sẵn để cho phép mã này tiếp tục thực thi trước các tác vụ ít quan trọng hơn trong hàng đợi:

```js
function yield() {
  // Dùng scheduler.yield nếu nó tồn tại:
  if ("scheduler" in window && "yield" in scheduler) {
    return scheduler.yield();
  }

  // Fallback về setTimeout:
  return new Promise((resolve) => {
    setTimeout(resolve, 0);
  });
}
```

## Giao diện

- {{domxref("Scheduler")}}
  - : Chứa các phương thức {{domxref('Scheduler.postTask', 'postTask()')}} và {{domxref('Scheduler.yield', 'yield()')}} để thêm các tác vụ đã được ưu tiên vào lịch chạy.
    Một thực thể của giao diện này có sẵn trên các đối tượng global {{domxref("Window")}} hoặc {{domxref("WorkerGlobalScope")}} (`globalThis.scheduler`).
- {{domxref("TaskController")}}
  - : Hỗ trợ cả việc hủy tác vụ và thay đổi độ ưu tiên của nó.
- {{domxref("TaskSignal")}}
  - : Một đối tượng signal cho phép bạn hủy tác vụ và thay đổi độ ưu tiên của nó, nếu cần, bằng cách dùng đối tượng {{domxref("TaskController")}}.
- {{domxref("TaskPriorityChangeEvent")}}
  - : Giao diện cho sự kiện {{domxref("TaskSignal/prioritychange_event","prioritychange")}}, được gửi đi khi độ ưu tiên của một tác vụ thay đổi.

> [!NOTE]
> Nếu [độ ưu tiên tác vụ](#task_priorities) không bao giờ cần thay đổi, bạn có thể dùng {{domxref("AbortController")}} và {{domxref("AbortSignal")}} đi kèm thay cho {{domxref("TaskController")}} và {{domxref("TaskSignal")}}.

### Phần mở rộng cho các giao diện khác

- {{domxref("Window.scheduler")}} và {{domxref("WorkerGlobalScope.scheduler")}}
  - : Các thuộc tính này là điểm vào để dùng phương thức `Scheduler.postTask()` trong ngữ cảnh window hoặc worker tương ứng.

## Ví dụ

Lưu ý rằng các ví dụ dưới đây dùng `myLog()` để ghi vào một vùng văn bản.
Mã cho vùng log và phương thức thường được ẩn đi để không làm xao lãng khỏi đoạn mã liên quan hơn.

```html
<!-- Nội dung ví dụ tiếp tục trong bản gốc MDN -->
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [prioritized-task-scheduling trong web.dev](https://web.dev/articles/optimize-long-tasks)
- [Scheduler API](/en-US/docs/Web/API/Scheduler)
