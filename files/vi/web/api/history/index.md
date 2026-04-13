---
title: History
slug: Web/API/History
page-type: web-api-interface
browser-compat: api.History
---

{{APIRef("History API")}}

Giao diện **`History`** của {{domxref("History API", "", "", "nocode")}} cho phép thao tác với _lịch sử phiên_ của trình duyệt, tức là các trang đã được truy cập trong tab hoặc khung mà trang hiện tại đang được tải trong đó.

Chỉ có một thể hiện `history` duy nhất (một _singleton_) có thể truy cập thông qua đối tượng toàn cục {{domxref("Window.history", "history")}}.

> [!NOTE]
> Giao diện này chỉ khả dụng trên luồng chính ({{domxref("Window")}}). Không thể truy cập nó trong ngữ cảnh {{domxref("Worker")}} hoặc {{domxref("Worklet")}}.

## Thuộc tính thể hiện

_Giao diện `History` không kế thừa thuộc tính nào._

- {{domxref("History.length","length")}} {{ReadOnlyInline}}
  - : Trả về một `Integer` biểu thị số phần tử trong lịch sử phiên, bao gồm cả trang hiện đang được tải. Ví dụ, với một trang được tải trong tab mới, thuộc tính này trả về `1`.
- {{domxref("History.scrollRestoration","scrollRestoration")}}
  - : Cho phép ứng dụng web đặt rõ ràng hành vi khôi phục vị trí cuộn mặc định khi điều hướng lịch sử. Thuộc tính này có thể là `auto` hoặc `manual`.
- {{domxref("History.state","state")}} {{ReadOnlyInline}}
  - : Trả về một giá trị `any` biểu thị trạng thái ở đầu ngăn xếp lịch sử. Đây là cách xem trạng thái mà không cần chờ sự kiện {{domxref("Window/popstate_event", "popstate")}}.

## Phương thức thể hiện

_Giao diện `History` không kế thừa phương thức nào._

- {{domxref("History.back","back()")}}
  - : Phương thức bất đồng bộ này quay lại trang trước đó trong lịch sử phiên, tương đương thao tác người dùng nhấn nút <kbd>Back</kbd> của trình duyệt. Tương đương với `history.go(-1)`.

    Gọi phương thức này để quay lui vượt quá trang đầu tiên trong lịch sử phiên sẽ không có tác dụng và không ném ra ngoại lệ.

- {{domxref("History.forward","forward()")}}
  - : Phương thức bất đồng bộ này chuyển đến trang tiếp theo trong lịch sử phiên, tương đương thao tác người dùng nhấn nút <kbd>Forward</kbd> của trình duyệt; tương đương với `history.go(1)`.

    Gọi phương thức này để đi tiếp vượt quá trang mới nhất trong lịch sử phiên sẽ không có tác dụng và không ném ra ngoại lệ.

- {{domxref("History.go","go()")}}
  - : Tải bất đồng bộ một trang từ lịch sử phiên, được xác định bởi vị trí tương đối của nó so với trang hiện tại, ví dụ `-1` cho trang trước hoặc `1` cho trang tiếp theo. Nếu bạn chỉ định giá trị ngoài phạm vi (ví dụ `-1` khi không có trang nào đã truy cập trước đó trong lịch sử phiên), phương thức này sẽ lặng lẽ không làm gì. Gọi `go()` mà không có tham số hoặc với giá trị `0` sẽ tải lại trang hiện tại.
- {{domxref("History.pushState","pushState()")}}
  - : Đẩy dữ liệu đã cho lên ngăn xếp lịch sử phiên cùng với tiêu đề được chỉ định (và URL, nếu có). Dữ liệu được DOM xem là opaque; bạn có thể truyền vào bất kỳ đối tượng JavaScript nào có thể tuần tự hóa. Lưu ý rằng hiện tại mọi trình duyệt ngoại trừ Safari đều bỏ qua tham số _title_. Để biết thêm chi tiết, xem [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API).
- {{domxref("History.replaceState","replaceState()")}}
  - : Cập nhật mục mới nhất trên ngăn xếp lịch sử bằng dữ liệu, tiêu đề và, nếu có, URL đã chỉ định. Dữ liệu được DOM xem là opaque; bạn có thể truyền vào bất kỳ đối tượng JavaScript nào có thể tuần tự hóa. Lưu ý rằng hiện tại mọi trình duyệt ngoại trừ Safari đều bỏ qua tham số _title_. Để biết thêm chi tiết, xem [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Đối tượng toàn cục {{domxref("Window.history", "history")}}
