---
title: Giới thiệu về kiểm thử đa trình duyệt
short-title: Giới thiệu
slug: Learn_web_development/Extensions/Testing/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Testing/Testing_strategies", "Learn_web_development/Extensions/Testing")}}

Bài viết này cung cấp tổng quan về kiểm thử đa trình duyệt: kiểm thử đa trình duyệt là gì, một số vấn đề thông thường, và một số cách tiếp cận để gỡ lỗi/khắc phục sự cố.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Đạt được hiểu biết về các khái niệm cấp cao liên quan đến kiểm thử đa trình duyệt.
      </td>
    </tr>
  </tbody>
</table>

## Kiểm thử đa trình duyệt là gì?

Kiểm thử đa trình duyệt là thực hành đảm bảo một trang web hoạt động trên nhiều trình duyệt và thiết bị khác nhau. Các nhà phát triển web nên xem xét:

- Các trình duyệt khác nhau, bao gồm các trình duyệt cũ hơn không hỗ trợ tất cả các tính năng JS/CSS mới nhất.
- Các thiết bị khác nhau, từ máy tính để bàn và máy tính xách tay đến máy tính bảng và điện thoại thông minh, đến TV thông minh, với các khả năng phần cứng khác nhau.
- Những người khuyết tật, những người có thể phụ thuộc vào công nghệ hỗ trợ như trình đọc màn hình, hoặc chỉ sử dụng bàn phím.

Hãy nhớ rằng bạn không phải là người dùng của mình — chỉ vì trang web của bạn hoạt động trên MacBook Pro hoặc Galaxy Nexus cao cấp của bạn, không có nghĩa là nó sẽ hoạt động cho tất cả người dùng!

> [!NOTE]
> [Make the web work for everyone](https://hacks.mozilla.org/2016/07/make-the-web-work-for-everyone/) thảo luận về các trình duyệt khác nhau, thị phần của chúng và các vấn đề tương thích đa trình duyệt liên quan.

Các trang web nên có thể truy cập trên các trình duyệt và thiết bị khác nhau, và đối với những người khuyết tật. Một trang web không cần phải cung cấp trải nghiệm hoàn toàn giống nhau trên tất cả các trình duyệt và thiết bị, miễn là chức năng cốt lõi có thể truy cập được theo một cách nào đó.

## Tại sao vấn đề đa trình duyệt xảy ra?

Có nhiều lý do khác nhau tại sao vấn đề đa trình duyệt xảy ra:

- Đôi khi trình duyệt có lỗi, hoặc triển khai các tính năng theo cách khác nhau.
- Một số trình duyệt có thể có mức hỗ trợ khác nhau cho các tính năng công nghệ so với các trình duyệt khác.
- Một số thiết bị có thể có các ràng buộc khiến trang web chạy chậm, hoặc hiển thị không đẹp.

## Quy trình làm việc cho kiểm thử đa trình duyệt

Tất cả công việc kiểm thử đa trình duyệt này nghe có vẻ tốn thời gian và đáng sợ, nhưng không nhất thiết phải như vậy — bạn chỉ cần lên kế hoạch cẩn thận và đảm bảo bạn thực hiện đủ kiểm thử ở đúng nơi để đảm bảo bạn không gặp phải các vấn đề bất ngờ.

Quy trình làm việc để kiểm thử và sửa lỗi có thể được chia thành bốn giai đoạn sau:

**Lập kế hoạch ban đầu** > **Phát triển** > **Kiểm thử/phát hiện** > **Sửa lỗi/lặp lại**

### Lập kế hoạch ban đầu

Trong giai đoạn lập kế hoạch ban đầu, bạn sẽ xác định chính xác trang web nên làm gì, nhìn như thế nào, v.v. Bạn cũng cần biết đối tượng mục tiêu của trang web — trình duyệt, thiết bị, v.v. mà người dùng mục tiêu sẽ sử dụng.

Ví dụ: nếu bạn đang xây dựng trang web thương mại điện tử phục vụ khách hàng ở Bắc Mỹ, trang web nên hoạt động hoàn toàn trong một vài phiên bản mới nhất của các trình duyệt máy tính để bàn và di động phổ biến nhất — bao gồm Chrome (và Edge, Opera), Firefox và Safari. Nó cũng nên có thể truy cập với tuân thủ WCAG AA.

### Phát triển

Bây giờ đến giai đoạn phát triển trang web. Bạn nên chia các phần khác nhau của quá trình phát triển thành các mô-đun.

Có nhiều chiến lược chung cho phát triển đa trình duyệt, ví dụ:

- Làm cho tất cả chức năng hoạt động càng gần nhau càng tốt trong tất cả các trình duyệt mục tiêu.
- Chấp nhận rằng một số thứ sẽ không hoạt động như nhau trên tất cả các trình duyệt, và cung cấp các giải pháp khác nhau (chấp nhận được) trong các trình duyệt không hỗ trợ chức năng đầy đủ.
- Chấp nhận rằng trang web của bạn sẽ không hoạt động trong một số trình duyệt cũ, và tiếp tục.

Thông thường phát triển của bạn sẽ bao gồm sự kết hợp của ba cách tiếp cận trên. Điều quan trọng nhất là bạn kiểm thử từng phần nhỏ trước khi cam kết — đừng để tất cả kiểm thử đến cuối!

### Kiểm thử/phát hiện

Sau mỗi giai đoạn triển khai, bạn sẽ cần kiểm thử chức năng mới. Để bắt đầu, bạn nên đảm bảo không có vấn đề chung nào với mã của bạn đang ngăn tính năng của bạn hoạt động:

1. Kiểm thử trong một vài trình duyệt ổn định trên hệ thống của bạn, như Firefox, Safari, Chrome hoặc Edge.
2. Thực hiện một số kiểm thử trợ năng đơn giản, chẳng hạn như thử sử dụng trang web của bạn chỉ với bàn phím.
3. Kiểm thử trên nền tảng di động, chẳng hạn như Android hoặc iOS.

Lựa chọn đơn giản nhất là tự thực hiện tất cả kiểm thử bạn có thể. Nếu bạn không có phương tiện để kiểm thử tất cả các kết hợp trình duyệt, hệ điều hành và thiết bị, bạn cũng có thể sử dụng trình mô phỏng và máy ảo.

### Sửa lỗi/lặp lại

Khi bạn đã phát hiện ra lỗi, bạn cần cố gắng sửa nó.

Điều đầu tiên cần làm là thu hẹp nơi lỗi xảy ra càng nhiều càng tốt. Lấy nhiều thông tin nhất có thể từ người báo cáo lỗi — nền tảng, thiết bị, phiên bản trình duyệt, v.v.

Khi sửa xong, bạn sẽ muốn lặp lại quá trình kiểm thử để đảm bảo việc sửa lỗi đang hoạt động tốt và không làm trang web bị hỏng ở những chỗ khác hay trình duyệt khác.

## Báo cáo lỗi

Nếu bạn phát hiện lỗi trong trình duyệt, bạn nên báo cáo chúng:

- [Firefox Bugzilla](https://bugzilla.mozilla.org/)
- [Safari](https://bugs.webkit.org/)
- [Chrome](https://issues.chromium.org/issues)
- [Opera](https://opera.atlassian.net/servicedesk/customer/portal/9)

## Tóm tắt

Bài viết này nên đã cho bạn hiểu biết cấp cao về các khái niệm quan trọng nhất mà bạn cần biết về kiểm thử đa trình duyệt. Với kiến thức này, bạn hiện đã sẵn sàng tiến về phía trước và bắt đầu học về các chiến lược kiểm thử đa trình duyệt.

{{NextMenu("Learn_web_development/Extensions/Testing/Testing_strategies", "Learn_web_development/Extensions/Testing")}}
