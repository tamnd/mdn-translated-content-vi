---
title: Hiệu suất cảm nhận
slug: Learn_web_development/Extensions/Performance/Perceived_performance
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/What_is_web_performance", "Learn_web_development/Extensions/Performance/Measuring_performance", "Learn_web_development/Extensions/Performance")}}

**[Hiệu suất cảm nhận](/en-US/docs/Glossary/Perceived_performance)** là thước đo chủ quan về hiệu suất, khả năng phản hồi và độ tin cậy của trang web. Nói cách khác, trang web có vẻ nhanh đến mức nào đối với người dùng. Khó định lượng và đo lường hơn tốc độ hoạt động thực tế, nhưng có lẽ còn quan trọng hơn.

Bài viết này cung cấp giới thiệu ngắn gọn về các yếu tố ảnh hưởng đến hiệu suất cảm nhận, cùng với một số công cụ để đánh giá và cải thiện nhận thức.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Để có sự quen thuộc cơ bản về nhận thức của người dùng về hiệu suất web.</td>
    </tr>
  </tbody>
</table>

## Tổng quan

Nhận thức về tốc độ tải và phản hồi của trang (và mức độ mượt mà) với tương tác người dùng thậm chí còn quan trọng hơn thời gian thực tế cần thiết để tải tài nguyên. Mặc dù bạn có thể không thể làm cho trang web của mình chạy nhanh hơn về mặt vật lý, nhưng bạn hoàn toàn có thể cải thiện cảm giác nhanh _như thế nào_ đối với người dùng của mình.

Một quy tắc chung tốt để cải thiện hiệu suất cảm nhận là thường tốt hơn khi cung cấp phản hồi nhanh và cập nhật trạng thái thường xuyên hơn là để người dùng chờ đợi cho đến khi một hoạt động hoàn thành hoàn toàn (trước khi cung cấp bất kỳ thông tin nào). Ví dụ, khi tải một trang, tốt hơn là hiển thị văn bản khi nó đến thay vì chờ tất cả hình ảnh và các tài nguyên khác. Mặc dù nội dung chưa được tải xuống hoàn toàn, người dùng có thể thấy có điều gì đó đang xảy ra và họ có thể bắt đầu tương tác với nội dung.

> [!NOTE]
> Thời gian dường như trôi qua nhanh hơn đối với những người dùng đang tích cực tham gia, bị phân tâm hoặc được giải trí, so với những người đang thụ động chờ đợi điều gì đó xảy ra. Khi có thể, hãy tích cực thu hút và thông báo cho người dùng đang chờ đợi một tác vụ hoàn thành.

Tương tự, tốt hơn là hiển thị "hoạt ảnh đang tải" ngay khi người dùng nhấp vào liên kết để thực hiện một hoạt động dài. Mặc dù điều này không thay đổi thời gian cần để hoàn thành hoạt động, trang web cảm thấy phản hồi hơn, và người dùng biết rằng nó đang làm điều gì đó hữu ích.

## Các số liệu hiệu suất

Không có một số liệu hay bài kiểm tra nào có thể được chạy trên một trang web để đánh giá cách người dùng "cảm thấy". Tuy nhiên, có một số số liệu có thể là "các chỉ số hữu ích":

- [First Paint](/en-US/docs/Glossary/First_paint)
  - : Thời gian bắt đầu hoạt động vẽ đầu tiên. Lưu ý rằng thay đổi này có thể không nhìn thấy được; nó có thể là cập nhật màu nền đơn giản hoặc thứ gì đó thậm chí ít đáng chú ý hơn.
- [First Contentful Paint](/en-US/docs/Glossary/First_contentful_paint) (FCP)
  - : Thời gian cho đến khi kết xuất quan trọng đầu tiên (ví dụ: văn bản, hình ảnh nền trước hoặc nền, canvas hoặc SVG, v.v.). Lưu ý rằng nội dung này không nhất thiết phải hữu ích hoặc có ý nghĩa.
- [First Meaningful Paint](/en-US/docs/Glossary/First_meaningful_paint) (FMP)
  - : Thời gian mà nội dung hữu ích được kết xuất lên màn hình.
- [Largest Contentful Paint](https://wicg.github.io/largest-contentful-paint/) (LCP)
  - : Thời gian kết xuất của phần tử nội dung lớn nhất hiển thị trong viewport.
- [Speed index](/en-US/docs/Glossary/Speed_index)
  - : Đo thời gian trung bình để các điểm ảnh trên màn hình hiển thị được vẽ.
- [Time to interactive](/en-US/docs/Glossary/Time_to_interactive)
  - : Thời gian cho đến khi giao diện người dùng có sẵn cho tương tác người dùng (tức là [tác vụ dài](/en-US/docs/Glossary/Long_task) cuối cùng của quá trình tải hoàn thành).

## Cải thiện hiệu suất

Dưới đây là một số mẹo và thủ thuật để giúp cải thiện hiệu suất cảm nhận:

### Giảm thiểu tải ban đầu

Để cải thiện hiệu suất cảm nhận, hãy giảm thiểu tải trang ban đầu. Nói cách khác, trước tiên hãy tải xuống nội dung người dùng sẽ tương tác ngay lập tức, và tải xuống phần còn lại sau "trong nền". Tổng lượng nội dung được tải xuống thực sự có thể tăng lên, nhưng người dùng chỉ _chờ đợi_ một lượng rất nhỏ, vì vậy tải xuống cảm thấy nhanh hơn.

Tách chức năng tương tác khỏi nội dung, và tải văn bản, kiểu và hình ảnh có thể nhìn thấy khi tải ban đầu. Trì hoãn, hoặc tải lười, hình ảnh, iframe, đa phương tiện hoặc tập lệnh không được sử dụng hoặc không hiển thị khi tải trang ban đầu. Ngoài ra, bạn nên tối ưu hóa các tài nguyên bạn tải. Hình ảnh và video nên được phục vụ ở định dạng tối ưu nhất, nén và đúng kích thước.

### Ngăn ngừa nội dung nhảy và các tính toán lại bố cục (reflow) khác

Hình ảnh hoặc các tài nguyên khác gây ra nội dung bị đẩy xuống hoặc nhảy đến một vị trí khác, như tải quảng cáo từ bên thứ ba, có thể làm cho trang có cảm giác như vẫn đang tải và gây hại cho hiệu suất cảm nhận. Sự tính toán lại bố cục của nội dung đặc biệt tệ cho trải nghiệm người dùng khi không được khởi tạo bởi tương tác người dùng. Nếu một số tài nguyên sẽ tải chậm hơn những tài nguyên khác, với các phần tử tải sau khi nội dung khác đã được vẽ lên màn hình, hãy lên kế hoạch trước và để lại không gian trong bố cục cho chúng để nội dung không nhảy hoặc thay đổi kích thước, đặc biệt sau khi trang web đã trở nên tương tác.

### Tránh trì hoãn tệp phông chữ

Lựa chọn phông chữ là quan trọng. Chọn một phông chữ phù hợp có thể cải thiện đáng kể trải nghiệm người dùng. Từ quan điểm hiệu suất cảm nhận, "nhập phông chữ tối ưu phụ" có thể dẫn đến nhấp nháy khi văn bản được tạo kiểu hoặc khi chuyển sang phông chữ khác.

Làm cho các phông chữ dự phòng có cùng kích thước và độ đậm để khi phông chữ tải, sự thay đổi trang ít đáng chú ý hơn.

### Các phần tử tương tác có thể tương tác

Đảm bảo rằng các phần tử tương tác có thể nhìn thấy luôn có thể tương tác và phản hồi. Nếu các phần tử đầu vào có thể nhìn thấy, người dùng phải có thể tương tác với chúng mà không bị trễ. Người dùng cảm thấy có gì đó bị chậm khi chúng mất hơn 50ms để phản hồi. Họ cảm thấy rằng trang đang hoạt động kém khi nội dung vẽ lại chậm hơn 16,67ms (hoặc 60 khung hình mỗi giây) hoặc vẽ lại ở các khoảng thời gian không đều.

Làm cho những thứ như gợi ý trước khi nhập (type-ahead) trở thành một cải tiến dần dần: sử dụng CSS để hiển thị modal đầu vào, JS để thêm tự động hoàn thành khi có sẵn.

### Làm cho các bộ khởi tạo tác vụ xuất hiện tương tác hơn

Thực hiện yêu cầu nội dung trên `keydown` thay vì chờ `keyup` có thể giảm thời gian tải cảm nhận của nội dung 200ms. Thêm hoạt ảnh 200ms thú vị nhưng không gây phiền nhiễu vào sự kiện `keyup` đó có thể giảm thêm 200ms của thời gian tải cảm nhận. Bạn không tiết kiệm 400ms thời gian, nhưng người dùng không cảm thấy như họ đang chờ đợi nội dung cho đến khi, thực ra, họ đang chờ đợi nội dung.

## Kết luận

Bằng cách giảm thời gian người dùng phải chờ đợi cho nội dung _hữu ích_, và giữ cho trang web phản hồi và hấp dẫn, người dùng sẽ cảm thấy như trang web hoạt động tốt hơn — ngay cả khi thời gian thực tế để tải tài nguyên vẫn như cũ.

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/What_is_web_performance", "Learn_web_development/Extensions/Performance/Measuring_performance", "Learn_web_development/Extensions/Performance")}}
