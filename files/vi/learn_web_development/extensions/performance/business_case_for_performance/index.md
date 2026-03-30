---
title: Lý do kinh doanh cho hiệu suất web
short-title: Lý do kinh doanh về hiệu suất
slug: Learn_web_development/Extensions/Performance/business_case_for_performance
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/CSS", "Learn_web_development/Extensions/Performance/Best_practices", "Learn_web_development/Extensions/Performance")}}

Chúng ta đã thảo luận về tầm quan trọng của hiệu suất web. Bạn đã học được những gì cần làm để tối ưu hóa hiệu suất web. Nhưng làm thế nào để thuyết phục khách hàng và/hoặc quản lý của bạn ưu tiên và đầu tư vào hiệu suất? Trong phần này, chúng ta thảo luận về việc tạo ra một lập luận kinh doanh rõ ràng để thuyết phục những người ra quyết định thực hiện đầu tư.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >, và hiểu biết cơ bản về
        <a href="/en-US/docs/Web/Performance">tối ưu hóa hiệu suất web</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Đạt được sự tự tin khi làm việc với khách hàng và quản lý để họ coi hiệu suất web là ưu tiên.
      </td>
    </tr>
  </tbody>
</table>

## Biến hiệu suất thành ưu tiên kinh doanh

Chúng ta đã thảo luận về cách ưu tiên hiệu suất có thể cải thiện trải nghiệm người dùng và do đó doanh thu. Chúng ta biết rằng không ưu tiên hiệu suất web có thể dẫn đến mất doanh thu kinh doanh. Bài viết này thảo luận về cách một số số liệu kinh doanh nhất định liên quan trực tiếp đến trải nghiệm hiệu suất web của người dùng và cách áp dụng thiết kế dịch vụ để nâng cao trải nghiệm hiệu suất web của người dùng. Nó nhấn mạnh tầm quan trọng của việc hiểu cách các trải nghiệm tích lũy ảnh hưởng đến tỷ lệ chuyển đổi và giữ chân.

### Ngân sách hiệu suất

Đặt ngân sách hiệu suất web có thể giúp bạn đảm bảo nhóm vẫn đi đúng hướng trong việc duy trì trang web và giúp ngăn ngừa sự suy giảm. Ngân sách hiệu suất là một tập hợp các giới hạn được đặt ra để chỉ định các giới hạn, chẳng hạn như số lượng yêu cầu HTTP tối đa được phép, tổng kích thước tối đa của tất cả các tài nguyên kết hợp, FPS tối thiểu cho phép trên một thiết bị cụ thể, v.v., phải được duy trì. Ngân sách có thể được áp dụng cho một tệp đơn, một loại tệp, tất cả các tệp được tải trên một trang, một số liệu cụ thể, hoặc một ngưỡng trong một khoảng thời gian. Ngân sách phản ánh các mục tiêu có thể đạt được; dù chúng dựa trên thời gian, số lượng hay quy tắc.

Định nghĩa và thúc đẩy ngân sách giúp những người ủng hộ hiệu suất bênh vực cho trải nghiệm người dùng tốt so với các lợi ích cạnh tranh, chẳng hạn như tiếp thị, bán hàng hoặc thậm chí các nhà phát triển khác có thể muốn thêm video, script bên thứ ba hoặc thậm chí framework. [Ngân sách hiệu suất](/en-US/docs/Web/Performance/Guides/Performance_budgets) giúp các nhóm nhà phát triển bảo vệ hiệu suất tối ưu cho người dùng trong khi cho phép doanh nghiệp khai thác các thị trường mới và cung cấp các trải nghiệm tùy chỉnh.

### Các chỉ số hiệu suất chính (KPI)

Đặt các chỉ số hiệu suất chính (KPI) như mục tiêu có thể làm nổi bật các mục tiêu hiệu suất cũng là mục tiêu kinh doanh. KPI có thể là cả một tập hợp các số liệu kinh doanh quan trọng trong việc đo lường tác động của trải nghiệm người dùng và hiệu suất đến dòng doanh thu hàng đầu của doanh nghiệp, và một cách để chứng minh lợi ích của việc ưu tiên hiệu suất. Dưới đây là một số KPI để xem xét:

- **Tỷ lệ chuyển đổi**
  - : Phần trăm lưu lượng truy cập của bạn thực hiện hành động dự định, chẳng hạn như hoàn tất mua hàng hoặc đăng ký nhận bản tin. Khi trang web kinh doanh chậm, nó có thể ngăn người dùng hoàn thành nhiệm vụ dự định của họ. Điều này có thể dẫn đến tỷ lệ chuyển đổi thấp.
- **Thời gian trên trang**
  - : Thời gian trung bình mà người dùng của bạn tổng cộng dành cho trang web của bạn. Khi trang web hoạt động chậm, người dùng có nhiều khả năng rời bỏ trang sớm, điều này có thể dẫn đến số liệu thời gian trên trang thấp.
- **Điểm quảng bá ròng (NPS)**
  - : Điểm quảng bá ròng (NPS) là một số liệu để đánh giá lòng trung thành của khách hàng đối với thương hiệu, sản phẩm hoặc dịch vụ của một công ty. Trải nghiệm hiệu suất người dùng kém có thể tương đương với danh tiếng thương hiệu kém.

Đặt tỷ lệ chuyển đổi, thời gian trên trang và/hoặc điểm quảng bá ròng là KPI cho giá trị tài chính và các mục tiêu kinh doanh khác đối với các nỗ lực hiệu suất web, và giúp tăng cường sự ủng hộ, với các số liệu để chứng minh giá trị của các nỗ lực.

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/CSS", "Learn_web_development/Extensions/Performance/Best_practices", "Learn_web_development/Extensions/Performance")}}
