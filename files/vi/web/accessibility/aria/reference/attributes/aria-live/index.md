---
title: "ARIA: thuộc tính aria-live"
short-title: aria-live
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-live
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-live
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-live` cho biết một phần tử sẽ được cập nhật, và mô tả các loại cập nhật mà user agent, công nghệ trợ năng, và người dùng có thể mong đợi từ vùng live.

## Mô tả

Khi nội dung thay đổi sau khi tải ban đầu, người dùng công nghệ trợ năng (AT) có thể không "nhìn thấy" các thay đổi đó. Một số thay đổi là quan trọng. Một số khác thì không. Thuộc tính `aria-live` cho phép nhà phát triển thông báo cho người dùng về các cập nhật và chọn, dựa trên mức độ quan trọng và tính khẩn cấp, xem có nên thông báo ngay lập tức, chủ động, hay thụ động cho người dùng AT về các thay đổi trong nội dung hay không.

Nếu một phần của màn hình được cập nhật, và nó được tạo kiểu theo cách dễ nhận thấy, đa số người dùng nhìn thấy được thường sẽ chú ý tới các cập nhật trực tiếp. Trình đọc màn hình, ngược lại, chỉ tập trung vào một phần của trang tại một thời điểm; và phần đó có thể không phải nơi cập nhật xảy ra. Thuộc tính `aria-live` cung cấp cho nhà phát triển một cách để thông báo những thay đổi như vậy cho AT dựa trên các kích hoạt sự kiện do nhà phát triển đặt ra thay vì do hành động khởi tạo bởi người dùng, để họ biết rằng nội dung đã thay đổi.

```html
<div id="announce" aria-live="polite"></div>
```

Thuộc tính `aria-live` được đặt trên một phần tử **trống**. Khi có cập nhật trên trang, phần tử trống có thuộc tính `aria-live` đó nên được cập nhật bằng một thông báo ngắn cho người dùng biết rằng đã có cập nhật.

```html
<div id="announce" aria-live="polite">
  <p>Thông báo này sẽ được đọc lên.</p>
</div>
```

Khi API trợ năng nhận ra sự thay đổi trong vùng live ở trên, nó sẽ thông báo nội dung của vùng live đó dựa trên giá trị của thuộc tính. Phần tử **không** được đưa tiêu điểm.

Nếu bạn muốn toàn bộ nội dung của vùng live được đọc, hãy dùng [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic). Dùng [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant) để xác định chỉ những phần nào của bản cập nhật cần được đọc lại cho người dùng. Dùng [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy) để ngăn thông báo trong khi các cập nhật vẫn đang được thực hiện.

### Chọn giá trị `aria-live`

Vì một số người dùng công nghệ trợ năng không thể "nhìn thấy" các cập nhật trực tiếp, thuộc tính `aria-live` được dùng để xác định thông tin cập nhật nào người dùng nên được:

- Biết ngay lập tức,
- Được thông báo khi có cơ hội phù hợp, và
- Được thông báo chủ động nhưng có thể biết khi họ chọn tập trung vào khu vực đã cập nhật.

Giá trị của `aria-live` mô tả các loại cập nhật mà user agent, công nghệ trợ năng, và người dùng có thể mong đợi từ vùng live, và được dùng để thể hiện các mức độ quan trọng.

Khi thuộc tính `aria-live` được đặt thành `polite`, công nghệ trợ năng sẽ thông báo cho người dùng về các cập nhật nhưng nhìn chung không làm gián đoạn tác vụ hiện tại, với các cập nhật có mức ưu tiên thấp. Khi đặt thành `assertive`, công nghệ trợ năng sẽ thông báo ngay cho người dùng, có thể xóa hàng đợi lời nói của các cập nhật trước đó.

Trình đọc màn hình đệm nội dung khi trang được tải. Vì vậy, nội dung được thêm sau khi cây trợ năng ban đầu được xây dựng có thể không được chú ý nếu người dùng AT bắt đầu tiêu thụ nội dung trước khi các widget động được điền xong - người dùng có thể không biết về trang hoặc không thấy nội dung đang cập nhật khi các widget hoàn tất tải. Trong tình huống này, bạn có thể cho người dùng biết trang đã được cập nhật bằng cách đặt `aria-live="polite"`.

Các trang được điền đầy đủ cũng có thể có cập nhật. Ví dụ là nội dung như điểm thể thao trực tiếp, trình thu thập tin tức, và bảng giá cổ phiếu. Trừ khi những dạng cập nhật này là chức năng chính của trang, bạn có lẽ không muốn thông báo cho người dùng mỗi lần nó cập nhật, nhưng vẫn muốn cho họ biết widget có được cập nhật. Khi đó, bạn sẽ đặt `aria-live="off"`. Trong các tình huống này không có lý do gì để thông báo cho người dùng về cập nhật trừ khi họ đang tập trung vào vùng live.

Một số cập nhật trực tiếp là quan trọng và nhạy cảm về thời gian. Ví dụ, nếu bạn đang bán vé hòa nhạc và người dùng chỉ có một khoảng thời gian giới hạn để mua, bạn sẽ không muốn chờ đến lúc hoạt động lắng xuống mới nói rằng thời gian của họ sắp hết (hoặc đã hết). Khi cần được thông báo sớm nhất có thể, hãy đặt `aria-live="assertive"`. Nếu thông tin cập nhật là một [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role), thì không cần thuộc tính `aria-live`.

Trong tình huống có giới hạn thời gian này, để có thể truy cập được, bạn cũng cần [cung cấp cách để người dùng kéo dài thời gian sẵn có hoặc tắt hẳn bộ đếm thời gian](https://www.w3.org/WAI/WCAG21/Understanding/timing-adjustable.html).

### Dùng `aria-live`

Một vùng live bao gồm phần tử và tất cả các phần tử con của nó. Khi không được đặt trên nội dung đang cập nhật, giá trị của `aria-live` sẽ lấy từ phần tử tổ tiên gần nhất có giá trị `aria-live` hợp lệ. Khi được đặt thành `off`, hoặc khi thuộc tính bị bỏ qua hoàn toàn trên phần tử được cập nhật và tất cả các nút tổ tiên trong cây DOM, người dùng sẽ không được thông báo. Tuy nhiên, họ vẫn có thể nghe thấy các cập nhật nếu điều hướng tới vùng live.

> [!WARNING]
> Vì việc ngắt quãng có thể làm người dùng mất phương hướng hoặc khiến họ không hoàn thành tác vụ hiện tại, đừng dùng giá trị `assertive` trừ khi việc ngắt quãng là bắt buộc.

## Giá trị

- `assertive`
  - : Cho biết các cập nhật của vùng có mức ưu tiên cao nhất và nên được trình bày cho người dùng ngay lập tức.
- `off` (mặc định)
  - : Cho biết các cập nhật của vùng **không** nên được trình bày cho người dùng trừ khi người dùng hiện đang tập trung vào vùng đó.
- `polite`
  - : Cho biết các cập nhật của vùng nên được trình bày vào thời điểm thuận lợi tiếp theo, chẳng hạn như khi kết thúc đọc câu hiện tại hoặc khi người dùng tạm dừng gõ.

## Giao diện liên quan

- {{domxref("Element.ariaLive")}}
  - : Thuộc tính [`ariaLive`](/en-US/docs/Web/API/Element/ariaLive), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-live`.
- {{domxref("ElementInternals.ariaLive")}}
  - : Thuộc tính [`ariaLive`](/en-US/docs/Web/API/ElementInternals/ariaLive), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-live`.

## Vai trò liên quan

Được dùng trong **TẤT CẢ** các vai trò.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
- [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant)
- [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy)
- [`alert` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- {{domxref("Document.ariaNotify()")}}, {{domxref("Element.ariaNotify()")}}
