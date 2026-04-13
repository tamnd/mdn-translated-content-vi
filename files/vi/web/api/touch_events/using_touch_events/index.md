---
title: Sử dụng Touch Events
slug: Web/API/Touch_events/Using_Touch_Events
page-type: guide
---

{{DefaultAPISidebar("Touch Events")}}

Ngày nay, hầu hết nội dung Web được thiết kế cho đầu vào bàn phím và chuột. Tuy nhiên, các thiết bị có màn hình cảm ứng (đặc biệt là thiết bị di động) đã trở thành xu hướng chủ đạo và các ứng dụng Web có thể xử lý trực tiếp đầu vào dựa trên cảm ứng bằng cách sử dụng [sự kiện cảm ứng](/en-US/docs/Web/API/TouchEvent) hoặc ứng dụng có thể sử dụng _sự kiện chuột đã được diễn giải_ cho đầu vào ứng dụng. Một nhược điểm khi sử dụng sự kiện chuột là chúng không hỗ trợ đầu vào người dùng đồng thời, trong khi sự kiện cảm ứng hỗ trợ nhiều đầu vào đồng thời (có thể ở các vị trí khác nhau trên bề mặt cảm ứng), do đó nâng cao trải nghiệm người dùng.

Các giao diện sự kiện cảm ứng hỗ trợ các tương tác đơn và đa chạm đặc thù cho ứng dụng như cử chỉ hai ngón tay. Tương tác đa chạm bắt đầu khi một ngón tay (hoặc bút cảm ứng) chạm vào bề mặt tiếp xúc. Các ngón tay khác sau đó có thể chạm vào bề mặt và tùy chọn di chuyển qua bề mặt cảm ứng. Tương tác kết thúc khi các ngón tay được nhấc khỏi bề mặt. Trong suốt tương tác này, một ứng dụng nhận các sự kiện cảm ứng trong các giai đoạn bắt đầu, di chuyển và kết thúc. Ứng dụng có thể áp dụng ngữ nghĩa riêng của mình cho các đầu vào cảm ứng.

## Giao diện

Sự kiện cảm ứng bao gồm ba giao diện ({{domxref("Touch")}}, {{domxref("TouchEvent")}} và {{domxref("TouchList")}}) và các loại sự kiện sau:

- {{domxref("Element/touchstart_event", "touchstart")}} - kích hoạt khi điểm chạm được đặt trên bề mặt cảm ứng.
- {{domxref("Element/touchmove_event", "touchmove")}} - kích hoạt khi điểm chạm được di chuyển dọc theo bề mặt cảm ứng.
- {{domxref("Element/touchend_event", "touchend")}} - kích hoạt khi điểm chạm được nhấc khỏi bề mặt cảm ứng.
- {{domxref("Element/touchcancel_event", "touchcancel")}} - kích hoạt khi điểm chạm bị gián đoạn theo cách thực thi cụ thể (ví dụ, tạo ra quá nhiều điểm chạm).

Giao diện {{domxref("Touch")}} đại diện cho một điểm tiếp xúc đơn trên thiết bị nhạy cảm với cảm ứng. Điểm tiếp xúc thường được gọi là _điểm chạm_ hoặc đơn giản là _chạm_. Một lần chạm thường được tạo ra bởi ngón tay hoặc bút cảm ứng trên màn hình cảm ứng, bút hoặc touchpad. Các [thuộc tính](/en-US/docs/Web/API/Touch#instance_properties) của điểm chạm bao gồm định danh duy nhất, phần tử mục tiêu của điểm chạm cũng như tọa độ _X_ và _Y_ của vị trí điểm chạm tương đối với khung nhìn, trang và màn hình.

Giao diện {{domxref("TouchList")}} đại diện cho một _danh sách_ điểm tiếp xúc với bề mặt cảm ứng, một điểm chạm trên mỗi điểm tiếp xúc. Do đó, nếu người dùng kích hoạt bề mặt cảm ứng với một ngón tay, danh sách sẽ chứa một mục, và nếu người dùng chạm bề mặt với ba ngón tay, độ dài danh sách sẽ là ba.

Giao diện {{domxref("TouchEvent")}} đại diện cho sự kiện được gửi khi trạng thái tiếp xúc với bề mặt nhạy cảm với cảm ứng thay đổi. Các thay đổi trạng thái là bắt đầu tiếp xúc với bề mặt cảm ứng, di chuyển điểm chạm trong khi duy trì tiếp xúc với bề mặt, thả điểm chạm và hủy sự kiện cảm ứng. Các thuộc tính của giao diện này bao gồm trạng thái của nhiều _phím modifier_ (ví dụ phím <kbd>shift</kbd>) và các danh sách chạm sau:

- {{domxref("TouchEvent.touches","touches")}} - danh sách tất cả các điểm chạm hiện đang trên màn hình.
- {{domxref("TouchEvent.targetTouches","targetTouches")}} - danh sách các điểm chạm trên phần tử DOM _mục tiêu_.
- {{domxref("TouchEvent.changedTouches","changedTouches")}} - danh sách các điểm chạm có các mục phụ thuộc vào loại sự kiện liên quan:
  - Đối với sự kiện {{domxref("Element/touchstart_event", "touchstart")}}, đây là danh sách các điểm chạm đã trở nên hoạt động với sự kiện hiện tại.
  - Đối với sự kiện {{domxref("Element/touchmove_event", "touchmove")}}, đây là danh sách các điểm chạm đã thay đổi kể từ sự kiện cuối cùng.
  - Đối với sự kiện {{domxref("Element/touchend_event", "touchend")}}, đây là danh sách các điểm chạm đã được nhấc khỏi bề mặt (tức là tập hợp các điểm chạm tương ứng với các ngón tay không còn chạm vào bề mặt).

Cùng nhau, các giao diện này xác định một tập hợp tính năng tương đối cấp thấp, nhưng chúng hỗ trợ nhiều loại tương tác dựa trên cảm ứng, bao gồm các cử chỉ đa chạm quen thuộc như vuốt nhiều ngón tay, xoay, kẹp và zoom.

## Từ giao diện đến cử chỉ

Một ứng dụng có thể xem xét các yếu tố khác nhau khi định nghĩa ngữ nghĩa của cử chỉ. Ví dụ, khoảng cách điểm chạm đã di chuyển từ vị trí bắt đầu đến vị trí của nó khi lần chạm kết thúc. Một yếu tố tiềm năng khác là thời gian; ví dụ, thời gian trôi qua giữa lúc bắt đầu chạm và lúc kết thúc chạm, hoặc khoảng cách thời gian giữa hai _lần nhấp liên tiếp_ nhằm tạo ra cử chỉ nhấp đôi. Hướng của vuốt (ví dụ từ trái sang phải, từ phải sang trái, v.v.) là một yếu tố khác cần xem xét.

Danh sách chạm mà ứng dụng sử dụng phụ thuộc vào ngữ nghĩa _cử chỉ_ của ứng dụng. Ví dụ, nếu ứng dụng hỗ trợ một lần chạm đơn (tap) trên một phần tử, nó sẽ sử dụng danh sách {{domxref("TouchEvent.targetTouches","targetTouches")}} trong trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} để xử lý điểm chạm theo cách đặc thù cho ứng dụng. Nếu ứng dụng hỗ trợ vuốt hai ngón tay cho bất kỳ hai điểm chạm nào, nó sẽ sử dụng danh sách {{domxref("TouchEvent.changedTouches","changedTouches")}} trong trình xử lý sự kiện {{domxref("Element/touchmove_event", "touchmove")}} để xác định xem hai điểm chạm đã di chuyển hay chưa và sau đó thực hiện ngữ nghĩa của cử chỉ đó theo cách đặc thù cho ứng dụng.

Các trình duyệt thường phân phối các sự kiện chuột và nhấp _mô phỏng_ khi chỉ có một điểm chạm đang hoạt động. Các tương tác đa chạm liên quan đến hai hoặc nhiều điểm chạm đang hoạt động thường chỉ tạo ra các sự kiện cảm ứng. Để ngăn các sự kiện chuột mô phỏng được gửi, hãy sử dụng phương thức {{domxref("Event.preventDefault()","preventDefault()")}} trong các trình xử lý sự kiện cảm ứng. Nếu bạn muốn tương tác với cả chuột và cảm ứng, hãy sử dụng {{domxref("Pointer events", "", "", "nocode")}} thay thế.

## Các bước cơ bản

Phần này chứa cách sử dụng cơ bản của các giao diện trên. Xem [tổng quan sự kiện cảm ứng](/en-US/docs/Web/API/Touch_events) để có ví dụ chi tiết hơn.

Đăng ký trình xử lý sự kiện cho mỗi loại sự kiện cảm ứng.

```js
// Register touch event handlers
someElement.addEventListener("touchstart", processTouchStart);
someElement.addEventListener("touchmove", processTouchMove);
someElement.addEventListener("touchcancel", processTouchCancel);
someElement.addEventListener("touchend", processTouchEnd);
```

Xử lý sự kiện trong trình xử lý sự kiện, thực hiện ngữ nghĩa cử chỉ của ứng dụng.

```js
// touchstart handler
function processTouchStart(event) {
  // Use the event's data to call out to the appropriate gesture handlers
  switch (event.touches.length) {
    case 1:
      handleOneTouch(event);
      break;
    case 2:
      handleTwoTouches(event);
      break;
    case 3:
      handleThreeTouches(event);
      break;
    default:
      gestureNotSupported(event);
      break;
  }
}
```

Truy cập các thuộc tính của điểm chạm.

```js
// Create touchstart handler
someElement.addEventListener("touchstart", (event) => {
  // Iterate through the touch points that were activated
  // for this element and process each event 'target'
  for (const touch of event.targetTouches) {
    processTarget(touch.target);
  }
});
```

Ngăn trình duyệt xử lý _sự kiện chuột mô phỏng_.

```js
// touchmove handler
function processTouchMove(event) {
  // Set call preventDefault()
  event.preventDefault();
}
```

## Thực hành tốt nhất

Đây là một số _thực hành tốt nhất_ cần xem xét khi sử dụng sự kiện cảm ứng:

- Giảm thiểu lượng công việc được thực hiện trong các trình xử lý cảm ứng.
- Thêm các trình xử lý điểm chạm vào phần tử mục tiêu cụ thể (thay vì toàn bộ tài liệu hoặc các nút cao hơn trong cây tài liệu).
- Thêm các trình xử lý sự kiện {{domxref("Element/touchmove_event", "touchmove")}}, {{domxref("Element/touchend_event", "touchend")}} và {{domxref("Element/touchcancel_event", "touchcancel")}} bên trong {{domxref("Element/touchstart_event", "touchstart")}}.
- Phần tử hoặc nút chạm đích phải đủ lớn để chứa lần chạm ngón tay. Nếu vùng đích quá nhỏ, chạm vào nó có thể dẫn đến kích hoạt các sự kiện khác cho các phần tử liền kề.

## Trạng thái triển khai và phát triển

[Dữ liệu tương thích trình duyệt sự kiện cảm ứng](/en-US/docs/Web/API/Touch_events#browser_compatibility) cho thấy hỗ trợ sự kiện cảm ứng trong các trình duyệt di động tương đối rộng, trong khi hỗ trợ trình duyệt máy tính để bàn còn tụt hậu mặc dù có thêm các triển khai đang được tiến hành.

Một số tính năng mới liên quan đến [vùng chạm](/en-US/docs/Web/API/Touch#touch_area) của điểm chạm, tức là vùng tiếp xúc giữa người dùng và bề mặt cảm ứng, đang trong quá trình được chuẩn hóa. Các tính năng mới bao gồm bán kính _X_ và _Y_ của hình elip bao gồm chặt chẽ nhất vùng tiếp xúc của điểm chạm với bề mặt cảm ứng. _Góc xoay_ của điểm chạm, tức là số độ xoay cần áp dụng cho hình elip đã mô tả để căn chỉnh với vùng tiếp xúc, cũng đang được chuẩn hóa như là lượng áp lực áp dụng cho một điểm chạm.

## Còn về Pointer Events thì sao?

Sự ra đời của các cơ chế đầu vào mới dẫn đến độ phức tạp ứng dụng tăng lên để xử lý các sự kiện đầu vào khác nhau, chẳng hạn như sự kiện phím, sự kiện chuột, sự kiện bút/bút cảm ứng và sự kiện cảm ứng. Để giải quyết vấn đề này, [API Pointer Events](/en-US/docs/Web/API/Pointer_events) định nghĩa các sự kiện và các giao diện liên quan để xử lý đầu vào con trỏ không phụ thuộc phần cứng từ các thiết bị bao gồm chuột, bút, màn hình cảm ứng, v.v. Đó là, con trỏ trừu tượng tạo ra mô hình đầu vào thống nhất có thể đại diện cho điểm tiếp xúc cho ngón tay, bút/bút cảm ứng hoặc chuột.

Mô hình sự kiện con trỏ có thể đơn giản hóa xử lý đầu vào của ứng dụng vì con trỏ đại diện đầu vào từ bất kỳ thiết bị đầu vào nào. Ngoài ra, các loại sự kiện con trỏ rất giống với các loại sự kiện chuột (ví dụ, `pointerdown` và `pointerup`) do đó mã xử lý sự kiện con trỏ khớp chặt chẽ với mã xử lý chuột.

Trạng thái triển khai sự kiện con trỏ trong các trình duyệt [tương đối cao](https://caniuse.com/#search=pointer) với Chrome, Firefox, IE11 và Edge có triển khai đầy đủ.

## Xem thêm

- [Touch events](/en-US/docs/Web/API/Touch_events)
- [Pointer events](/en-US/docs/Web/API/Pointer_events)
- [Add touch to your site](https://web.dev/articles/add-touch-to-your-site) trên web.dev
- [Add touch screen support to your website (The easy way)](https://codicode.com/art/easy_way_to_add_touch_support_to_your_website.aspx)
- [Paint Program](https://rbyers.github.io/paint.html) của Rick Byers
- [Touch/pointer tests and demos](https://patrickhlauke.github.io/touch/) của Patrick H. Lauke
- [Touch Events Community Group](https://github.com/w3c/touch-events)
- [Mail list](https://lists.w3.org/Archives/Public/public-touchevents/)
- [W3C #touchevents IRC channel](irc://irc.w3.org:6667/)
