---
title: TouchEvent
slug: Web/API/TouchEvent
page-type: web-api-interface
browser-compat: api.TouchEvent
---

{{APIRef("Touch Events")}}

Giao diện **`TouchEvent`** biểu diễn một {{domxref("UIEvent")}} được gửi khi trạng thái tiếp xúc với bề mặt cảm ứng thay đổi. Bề mặt này có thể là màn hình cảm ứng hoặc bàn di chuột, chẳng hạn. Sự kiện có thể mô tả một hoặc nhiều điểm tiếp xúc với màn hình và bao gồm hỗ trợ phát hiện chuyển động, thêm và xóa điểm tiếp xúc, v.v.

Các thao tác chạm được biểu diễn bằng đối tượng {{domxref("Touch")}}; mỗi thao tác chạm được mô tả bởi vị trí, kích thước và hình dạng, lượng áp lực, và phần tử đích. Danh sách các thao tác chạm được biểu diễn bằng các đối tượng {{domxref("TouchList")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("TouchEvent.TouchEvent", "TouchEvent()")}}
  - : Tạo một đối tượng `TouchEvent`.

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ cha của nó, {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("TouchEvent.altKey")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean cho biết phím alt có được nhấn hay không khi sự kiện chạm được kích hoạt.
- {{domxref("TouchEvent.changedTouches")}} {{ReadOnlyInline}}
  - : Một {{domxref("TouchList")}} của tất cả các đối tượng {{domxref("Touch")}} biểu diễn các điểm tiếp xúc riêng lẻ có trạng thái đã thay đổi giữa sự kiện chạm trước đó và sự kiện này.
- {{domxref("TouchEvent.ctrlKey")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean cho biết phím control có được nhấn hay không khi sự kiện chạm được kích hoạt.
- {{domxref("TouchEvent.metaKey")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean cho biết phím meta có được nhấn hay không khi sự kiện chạm được kích hoạt.
- {{domxref("TouchEvent.shiftKey")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean cho biết phím shift có được nhấn hay không khi sự kiện chạm được kích hoạt.
- {{domxref("TouchEvent.targetTouches")}} {{ReadOnlyInline}}
  - : Một {{domxref("TouchList")}} của tất cả các đối tượng {{domxref("Touch")}} đang tiếp xúc với bề mặt cảm ứng **và** cũng bắt đầu trên cùng phần tử là mục tiêu của sự kiện.
- {{domxref("TouchEvent.touches")}} {{ReadOnlyInline}}
  - : Một {{domxref("TouchList")}} của tất cả các đối tượng {{domxref("Touch")}} biểu diễn tất cả các điểm tiếp xúc hiện tại với bề mặt, bất kể mục tiêu hoặc trạng thái thay đổi.
- {{domxref("TouchEvent.rotation")}} {{non-standard_inline()}} {{ReadOnlyInline}}
  - : Thay đổi về góc quay (tính bằng độ) kể từ khi sự kiện bắt đầu. Giá trị dương cho biết quay theo chiều kim đồng hồ; giá trị âm cho biết quay ngược chiều kim đồng hồ. Giá trị ban đầu: `0.0`.
- {{domxref("TouchEvent.scale")}} {{non-standard_inline()}} {{ReadOnlyInline}}
  - : Khoảng cách giữa hai ngón tay kể từ khi sự kiện bắt đầu. Được biểu thị dưới dạng bội số dấu phẩy động của khoảng cách ban đầu giữa các ngón tay khi bắt đầu sự kiện. Giá trị dưới 1.0 cho biết thao tác pinch vào (thu nhỏ). Giá trị trên 1.0 cho biết thao tác pinch ra (phóng to). Giá trị ban đầu: `1.0`.

## Các loại sự kiện chạm

Có một số loại sự kiện có thể được kích hoạt để cho biết rằng các thay đổi liên quan đến chạm đã xảy ra. Bạn có thể xác định loại sự kiện nào đã xảy ra bằng cách xem thuộc tính {{domxref("event.type", "TouchEvent.type")}} của sự kiện.

- {{domxref("Element/touchstart_event", "touchstart")}}
  - : Được gửi khi người dùng đặt một điểm chạm lên bề mặt cảm ứng.
    Mục tiêu của sự kiện sẽ là {{domxref("element")}} nơi thao tác chạm xảy ra.
- {{domxref("Element/touchend_event", "touchend")}}
  - : Được gửi khi người dùng nhấc một điểm chạm khỏi bề mặt;
    nghĩa là, khi họ nhấc ngón tay hoặc bút stylus khỏi bề mặt.
    Sự kiện này cũng được gửi
    nếu điểm chạm di chuyển ra ngoài cạnh của bề mặt;
    chẳng hạn, nếu ngón tay của người dùng trượt ra khỏi cạnh màn hình.

    Mục tiêu của sự kiện là cùng {{domxref("element")}}
    đã nhận sự kiện `touchstart`
    tương ứng với điểm chạm,
    ngay cả khi điểm chạm đã di chuyển ra ngoài phần tử đó.

    Điểm chạm (hoặc các điểm chạm)
    đã bị xóa khỏi bề mặt
    có thể được tìm thấy trong {{domxref("TouchList")}}
    được chỉ định bởi thuộc tính `changedTouches`.

- {{domxref("Element/touchmove_event", "touchmove")}}
  - : Được gửi khi người dùng di chuyển một điểm chạm dọc theo bề mặt.
    Mục tiêu của sự kiện là cùng {{domxref("element")}}
    đã nhận sự kiện `touchstart` tương ứng với điểm chạm,
    ngay cả khi điểm chạm đã di chuyển ra ngoài phần tử đó.

    Sự kiện này cũng được gửi
    nếu giá trị của các thuộc tính bán kính, góc quay hoặc lực của điểm chạm thay đổi.

    > [!NOTE]
    > Tốc độ gửi các sự kiện `touchmove` phụ thuộc vào trình duyệt, và cũng có thể thay đổi tùy thuộc vào khả năng phần cứng của người dùng. Bạn không được dựa vào mức độ chi tiết cụ thể của các sự kiện này.

- {{domxref("Element/touchcancel_event", "touchcancel")}}
  - : Được gửi khi một điểm chạm bị gián đoạn theo cách nào đó.
    Có một số lý do có thể xảy ra khiến điều này xảy ra
    (và lý do chính xác sẽ khác nhau tùy theo thiết bị cũng như trình duyệt):
    - Một sự kiện nào đó đã xảy ra đã hủy thao tác chạm; điều này có thể xảy ra nếu một cảnh báo modal xuất hiện trong quá trình tương tác.
    - Điểm chạm đã rời khỏi cửa sổ tài liệu và di chuyển vào khu vực giao diện của trình duyệt, một plugin, hoặc nội dung bên ngoài khác.
    - Người dùng đã đặt nhiều điểm chạm lên màn hình hơn mức có thể hỗ trợ, trong trường hợp đó {{domxref("Touch")}} sớm nhất trong {{domxref("TouchList")}} sẽ bị hủy.

### Sử dụng với addEventListener() và preventDefault()

Cần lưu ý rằng trong nhiều trường hợp, cả sự kiện chạm và chuột đều được gửi (để cho phép mã không dành riêng cho cảm ứng vẫn tương tác được với người dùng). Nếu bạn sử dụng sự kiện chạm, bạn nên gọi {{domxref("Event.preventDefault","preventDefault()")}} để ngăn sự kiện chuột cũng được gửi.

Ngoại lệ cho điều này là Chrome, bắt đầu từ phiên bản 56 (trên máy tính để bàn, Chrome cho Android và Android webview), nơi giá trị mặc định cho tùy chọn `passive` đối với {{domxref("Element/touchstart_event", "touchstart")}} và {{domxref("Element/touchmove_event", "touchmove")}} là `true` và các lệnh gọi {{domxref("Event.preventDefault","preventDefault()")}} sẽ không có hiệu lực. Để ghi đè hành vi này, bạn cần đặt tùy chọn `passive` thành `false`, sau đó gọi {{domxref("Event.preventDefault","preventDefault()")}} sẽ hoạt động như đã chỉ định. Thay đổi để coi các trình lắng nghe là `passive` theo mặc định ngăn trình lắng nghe chặn việc hiển thị trang trong khi người dùng đang cuộn. Bản demo có sẵn trên trang [Chrome Developer](https://developer.chrome.com/blog/passive-event-listeners/).

## Ví dụ

Xem [ví dụ trong bài viết chính về sự kiện chạm](/en-US/docs/Web/API/Touch_events#examples).

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện chạm](/en-US/docs/Web/API/Touch_events)
- {{domxref("GestureEvent")}}
