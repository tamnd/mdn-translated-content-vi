---
title: "EventTarget: phương thức dispatchEvent()"
short-title: dispatchEvent()
slug: Web/API/EventTarget/dispatchEvent
page-type: web-api-instance-method
browser-compat: api.EventTarget.dispatchEvent
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`dispatchEvent()`** của {{domxref("EventTarget")}} gửi một {{domxref("Event")}} tới đối tượng, đồng thời (đồng bộ) gọi các
bộ lắng nghe sự kiện bị ảnh hưởng theo đúng thứ tự. Các quy tắc xử lý sự kiện thông thường
(bao gồm pha capture và tùy chọn bubbling) cũng được áp dụng cho các sự kiện
được phát thủ công bằng `dispatchEvent()`.

Gọi `dispatchEvent()` là bước cuối cùng để _phát một sự kiện_. Sự kiện
lẽ ra phải được tạo và khởi tạo trước đó bằng hàm tạo {{domxref("Event/Event", "Event()")}}.

> [!NOTE]
> Khi gọi phương thức này, thuộc tính {{domxref("Event.target")}} sẽ được khởi tạo bằng `EventTarget` hiện tại.

Không giống như các sự kiện "gốc", vốn được trình duyệt phát ra và gọi bộ xử lý sự kiện
bất đồng bộ thông qua [vòng lặp sự kiện](/en-US/docs/Web/JavaScript/Reference/Execution_model),
`dispatchEvent()` gọi các bộ xử lý sự kiện _đồng bộ_. Tất cả các bộ xử lý sự kiện áp dụng sẽ được gọi và trả về trước khi `dispatchEvent()` trả về.

## Cú pháp

```js-nolint
dispatchEvent(event)
```

### Tham số

- `event`
  - : Đối tượng {{domxref("Event")}} cần phát. Thuộc tính {{domxref("Event.target")}} của nó sẽ được đặt thành {{domxref("EventTarget")}} hiện tại.

### Giá trị trả về

`false` nếu `event` có thể bị hủy, và ít nhất một trong các bộ xử lý sự kiện nhận `event` đã gọi {{domxref("Event.preventDefault()")}}. Ngược lại trả về `true`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DomException")}}
  - : Được ném ra nếu kiểu của sự kiện chưa được chỉ định trong lúc khởi tạo sự kiện.

> [!WARNING]
> Các ngoại lệ do bộ xử lý sự kiện ném ra sẽ được báo cáo là ngoại lệ chưa được bắt. Các bộ
> xử lý chạy trên một call stack lồng nhau; chúng chặn lời gọi gốc cho tới khi hoàn tất, nhưng
> các ngoại lệ không lan truyền trở lại lời gọi gốc.

## Ví dụ

Xem [Tạo và phát sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tham khảo đối tượng [Event](/en-US/docs/Web/API/Event)
