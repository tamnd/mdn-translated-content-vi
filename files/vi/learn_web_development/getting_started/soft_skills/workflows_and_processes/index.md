---
title: Quy trình và tiến trình làm việc
slug: Learn_web_development/Getting_started/Soft_skills/Workflows_and_processes
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Soft_skills/Collaboration_and_teamwork", "Learn_web_development/Getting_started/Soft_skills/Finding_a_job", "Learn_web_development/Getting_started/Soft_skills")}}

Một khía cạnh quan trọng của các dự án kỹ thuật mà người mới thường bỏ qua là ý tưởng về bức tranh toàn cảnh. Họ có thể học một công cụ hoặc ngôn ngữ riêng lẻ, nhưng không nhận thức được tất cả các thư viện, công cụ, hệ thống và vai trò công việc kết hợp lại để phát triển một ứng dụng web hoàn chỉnh. Các phần sau đây đề cập đến các khía cạnh bức tranh lớn hơn ở cấp độ cao.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Không có
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Các kết hợp công nghệ điển hình trong các dự án web.</li>
          <li>Các vai trò công việc điển hình trong một nhóm phát triển web.</li>
          <li>Các giai đoạn dự án kỹ thuật điển hình, và các vai trò công việc khác nhau tham gia ở đâu.</li>
          <li>Các quy trình quản lý công việc phổ biến, chẳng hạn như agile và waterfall.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các kết hợp công nghệ điển hình

Khi xây dựng một trang web, bạn sẽ sử dụng sự kết hợp của các công nghệ khác nhau, thường được gọi là **tech stack** (ngăn xếp công nghệ). Khi các trang web ngày càng lớn hơn và phức tạp hơn, tech stack cũng vậy. Nó có thể bắt đầu đơn giản khi bạn đang tạo một bản demo và chỉ có bạn và một vài đồng nghiệp sẽ xem nó. Tuy nhiên, tech stack của một trang web sản xuất có vẻ đơn giản có thể phức tạp hơn bạn nghĩ lúc đầu khi bạn xét đến việc nó cần:

- Tải nhanh (đây là mục đích của [hiệu suất](/vi/docs/Learn_web_development/Extensions/Performance/why_web_performance)).
- Xử lý một số lượng lớn người dùng đồng thời (nó phải có khả năng **mở rộng**).
- Được thiết kế tốt, để người dùng có thể dễ dàng truy cập thông tin và dịch vụ mà nó chứa.
- Dễ dàng cho một nhóm làm việc và bảo trì.

Ở cấp độ rất cao, tech stack của ứng dụng web có thể trông như thế này:

```plain
Front-end
HTML, CSS, JavaScript
|
Back-end
Node.js, .NET, PHP, Python, hoặc một số ngôn ngữ phía server khác
|
Cơ sở dữ liệu
MySQL, Postgres, MongoDB, hoặc một số cơ sở dữ liệu khác
|
Web server
Của riêng bạn, được xây dựng xung quanh một sản phẩm server như Apache, hoặc một dịch vụ như Netlify
```

> [!NOTE]
> Bạn thường sẽ thấy các từ viết tắt đề cập đến các tech stack phổ biến, chẳng hạn như [MEAN](https://www.mongodb.com/resources/languages/mean-stack) (MongoDB, Express, Angular, Node) hoặc [LAMP](<https://en.wikipedia.org/wiki/LAMP_(software_bundle)>) (Linux, Apache, MySQL, PHP hoặc Python).

Trên MDN, chúng tôi chủ yếu quan tâm đến phần front-end, nhưng ngay cả phần đó cũng có thể được chia thành nhiều phần khác nhau. Ví dụ về front-end:

- Bạn có thể sẽ sử dụng một JavaScript framework (chẳng hạn như [React](/vi/docs/Learn_web_development/Core/Frameworks_libraries/React_getting_started)) để xác định các thành phần kết hợp lại để tạo ra giao diện người dùng.
- Framework có thể sẽ sử dụng một số loại ngôn ngữ mẫu (chẳng hạn như [Mustache](https://mustache.github.io/)) để xác định cấu trúc HTML nhưng cũng cung cấp chức năng để bao gồm nội dung biến đổi một cách linh hoạt.
- Bạn sẽ bao gồm thông tin để tạo kiểu cho nội dung của mình thông qua CSS theo cách tương thích với framework. Điều này có thể được viết bằng CSS thuần túy, hoặc một CSS framework (như [Tailwind](https://tailwindcss.com/)) hoặc bộ tiền xử lý (như [Sass](https://sass-lang.com/)).
- Một dự án JavaScript nên bao gồm các bài kiểm tra, để đảm bảo rằng bất kỳ phần bổ sung mã mới nào cũng không phá vỡ chức năng của nó. Các bài kiểm tra thường được triển khai bằng framework kiểm thử (như [Jest](https://jestjs.io/)).
- Các trang web lớn hơn sẽ sử dụng công cụ đóng gói/xây dựng (như [Parcel](https://parceljs.org/)) để cải thiện hiệu suất bằng cách giảm kích thước file, xóa các thành phần không sử dụng khỏi mã sản xuất, v.v.
- Và nhiều hơn nữa.

> [!NOTE]
> Bạn thường sẽ nghe các trang web và ứng dụng được mô tả là được xây dựng bằng cách sử dụng các **mẫu kiến trúc** (architectural patterns) cụ thể. Ví dụ, [model-view-controller (MVC)](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) là một mẫu mà nhiều JavaScript framework theo, trong khi [publish–subscribe (pub/sub)](https://dev.to/willvelida/the-publisher-subscriber-pattern-pubsub-messaging-10in) thường được sử dụng bởi các ứng dụng nhắn tin. Không đặc biệt quan trọng rằng bạn hiểu các mẫu này một cách chi tiết, nhưng một số quen thuộc có thể hữu ích khi cố gắng hiểu một framework hoặc công cụ mới.

Cũng sẽ có các công cụ bên ngoài tech stack thực tế để giúp bạn quản lý nó hoặc tạo tài sản cho trang web, chẳng hạn như:

- Công cụ lập kế hoạch để giúp bạn lên kế hoạch những gì bạn sẽ làm trong suốt quá trình dự án ở cấp độ cao (như [Miro](https://miro.com/)).
- Hệ thống kiểm soát phiên bản (VCS). Bạn có thể sẽ sử dụng VCS dựa trên [git](https://git-scm.com/), như [GitHub](https://github.com/).
- Các gói thiết kế đồ họa/giao diện (như [Figma](https://www.figma.com/) hoặc [Canva](https://www.canva.com/)).
- Công cụ quản lý dự án như [Trello](https://trello.com/) hoặc [Asana](https://asana.com/).

Được rồi, đó là rất nhiều thứ cần tiếp thu. Lời khuyên của chúng tôi là **đừng hoảng loạn!** Mục đích của bài viết này không phải là để làm bạn lo lắng bằng cách khiến bạn nghĩ rằng đột nhiên bạn có gấp 10 lần số thứ cần học so với trước. Ý tưởng đơn giản là để bạn nhận thức được bức tranh lớn hơn về các dự án trang web, và cho bạn biết cơ bản về một số thuật ngữ mà bạn có thể gặp.

Cuối cùng, bạn sẽ phát triển một số kiến thức về một số công cụ và công nghệ trên, nhưng bạn sẽ không phải là chuyên gia trong tất cả chúng, cũng không cần phải như vậy — đó là mục đích của các nhóm. Hiện tại, bạn đang làm đúng việc khi học các kỹ năng cốt lõi như HTML, CSS và JavaScript. Nhiều công cụ hơn và chuyên môn hóa sẽ đến sau trong sự nghiệp của bạn.

## Các vai trò công việc

Trong một nhóm phát triển web, có nhiều vai trò công việc khác nhau tham gia; việc hiểu mỗi vai trò bao gồm những gì là hữu ích:

- **Giám đốc sản phẩm (Product manager)**
  - : Chịu trách nhiệm toàn bộ trang web từ góc độ sản phẩm — sản phẩm đang hoạt động như thế nào trên thị trường, so với đối thủ cạnh tranh? Điểm mạnh và điểm yếu của nó là gì? Đối tượng mục tiêu đang yêu cầu tính năng mới nào và tính năng nào có mức độ ưu tiên cao nhất? Các tiêu chí thành công chính của trang web là gì và các tính năng mới gần đây đã giúp đáp ứng những tiêu chí đó như thế nào? Giám đốc sản phẩm sẽ thu thập dữ liệu và viết báo cáo để giúp nhóm hiểu công việc của họ hiệu quả như thế nào và ưu tiên công việc trong tương lai.
- **Giám đốc dự án (Project manager)**
  - : Chịu trách nhiệm tổ chức công việc nhóm cần thực hiện. Giám đốc dự án sẽ tạo kế hoạch dự án với các nhiệm vụ được ưu tiên và ngày đến hạn, phân công nhân viên để thực hiện từng nhiệm vụ, tổ chức các cuộc họp kiểm tra thường xuyên để xem các mục tiêu tiến độ có được đáp ứng không và phát hiện bất kỳ vấn đề nào, và điều chỉnh kế hoạch khi cần.
- **Nhà thiết kế trải nghiệm người dùng (UX designer)**
  - : Chịu trách nhiệm hiểu nhu cầu của đối tượng mục tiêu của sản phẩm, và thiết kế quy trình làm việc/trải nghiệm của sản phẩm để đáp ứng nhu cầu của đối tượng đó hiệu quả nhất. Các câu hỏi UX điển hình là "chúng ta nên hướng người dùng đến đâu đầu tiên khi họ truy cập trang chủ của chúng ta?" và "làm thế nào chúng ta có thể làm cho việc đăng ký tài khoản dễ dàng và trực quan nhất có thể?" Công việc này thường được kết hợp với nghiên cứu và kiểm tra người dùng để hiểu rõ hơn về đối tượng mục tiêu, và tạo wireframe để truyền đạt ý tưởng. Nhà thiết kế UX là một trong những người tiêu thụ chính báo cáo của giám đốc sản phẩm.
- **Nhà thiết kế đồ họa (Graphic designer)**
  - : Chịu trách nhiệm công việc thiết kế trực quan trên dự án trang web. Nhà thiết kế đồ họa chịu trách nhiệm cho nhiều lĩnh vực khác nhau như typography, chọn bảng màu, tạo biểu tượng và các tài sản đồ họa khác, và tạo mockup trang web dựa trên wireframe của nhà thiết kế UX.
- **Lập trình viên front-end (Front-end developer)**
  - : Đây là (có thể) những gì bạn đang hướng đến nếu bạn đang đọc bài này! Lập trình viên front-end sử dụng HTML, CSS và JavaScript để tạo phần trực quan của trang web mà người dùng tương tác, đưa các mockup hành vi và trực quan do nhà thiết kế UX và đồ họa tạo ra vào cuộc sống.
- **Lập trình viên back-end (Back-end developer)**
  - : Chịu trách nhiệm các phần không trực quan của trang web. Họ viết mã back-end để yêu cầu dữ liệu nội bộ, tạo các trang HTML từ mẫu, và xử lý dữ liệu bên ngoài do người dùng gửi. Họ cũng xử lý cấu hình web server, giữ cho trang web an toàn, v.v.
- **Lập trình viên full-stack (Full-stack developer)**
  - : Xử lý cả nhiệm vụ phát triển front-end lẫn back-end.
- **Kỹ sư đảm bảo chất lượng (QA engineer)**
  - : Chịu trách nhiệm kiểm tra các tính năng mới để đảm bảo chúng hoạt động đúng cách và báo cáo lỗi, giao tiếp với các lập trình viên để giúp họ ưu tiên các sửa chữa cần thiết.
- **Chuyên gia nội dung/nhà văn kỹ thuật (Content specialist/technical writer)**
  - : Chịu trách nhiệm đảm bảo nội dung văn bản của trang web hoạt động tốt nhất có thể cho đối tượng mục tiêu. Điều này bao gồm cấu trúc thông tin và cách điều hướng nó, nhãn văn bản giao diện người dùng, bài đăng blog, văn bản tiếp thị và tài liệu sản phẩm.

### Các vai trò công việc ít phổ biến hơn

Các vai trò công việc ít phổ biến khác bao gồm:

- **Nhà nghiên cứu người dùng (User researcher)**
  - : Các nhóm lớn hơn thường sẽ có một nhà nghiên cứu chuyên biệt để thực hiện nghiên cứu và kiểm tra người dùng.
- **Chuyên gia tối ưu hóa công cụ tìm kiếm (SEO specialist)**
  - : Phân tích nội dung và cấu trúc của trang web và thực hiện các thay đổi sẽ khiến trang web hiển thị nhiều hơn trong các kết quả tìm kiếm liên quan. Xem {{glossary("SEO")}} để biết thêm thông tin.

## Các giai đoạn dự án kỹ thuật

Một dự án kỹ thuật điển hình có thể diễn ra như thế này:

1. Giám đốc sản phẩm xác định một tập hợp yêu cầu người dùng mới cho trang web.
2. Họ thảo luận với nhóm, và được quyết định rằng các yêu cầu này có thể được đáp ứng bằng cách thêm một tính năng mới vào trang web.
3. Giám đốc dự án thảo luận với nhóm về các công việc cần thiết riêng lẻ để tạo tính năng mới, và tạo một [quy trình làm việc để quản lý chúng](#work_management_processes).
4. Nhà thiết kế UX thiết kế một quy trình làm việc cho tính năng mới mô tả cách nó hoạt động, và một wireframe để cung cấp ý tưởng về vị trí phù hợp trên trang web.
5. Nhà thiết kế đồ họa thiết kế một mockup cho thấy tính năng sẽ trông như thế nào trên trang web, cùng với phông chữ và bảng màu được chọn.
6. Chuyên gia nội dung viết văn bản UI cần thiết cho tính năng và tài liệu hỗ trợ nó.
7. Lập trình viên back-end tạo các hệ thống cần thiết để lưu trữ và xử lý an toàn dữ liệu hỗ trợ tính năng.
8. Lập trình viên front-end tạo tính năng tương tác dựa trên mockup của nhà thiết kế đồ họa và kết nối nó với back-end để lấy dữ liệu cần thiết.
9. Kỹ sư QA kiểm tra kỹ lưỡng tính năng mới và viết báo cáo chi tiết về các vấn đề họ tìm thấy với nó.
10. Các lập trình viên sửa các lỗi được cho là đủ nghiêm trọng để ngăn chặn việc phát hành tính năng.
11. Sau khi các lỗi (chặn) được sửa và dự án được chấp thuận, tính năng có thể được đưa vào hoạt động trên trang web.

Đây là một cái nhìn đơn giản hóa — các giai đoạn khác sẽ tồn tại xung quanh việc triển khai tính năng, và các giai đoạn không nhất thiết phải hoàn thành theo thứ tự được hiển thị, nhưng điều này cho bạn ý tưởng về những gì liên quan.

## Các quy trình quản lý công việc

Giám đốc dự án sẽ sử dụng một số loại quy trình để quản lý dự án trang web, theo dõi tiến độ trên các công việc khác nhau, đảm bảo chúng được thực hiện đúng thứ tự và đúng hạn, v.v. Hai loại quy trình chính là:

- **Waterfall (Thác nước)**
  - : Đề cập đến việc chạy một dự án theo các giai đoạn rõ ràng, cố định, trong đó mỗi giai đoạn phụ thuộc vào giai đoạn trước, và không có quá nhiều thay đổi trong yêu cầu được dự kiến. Nói chung, một kết quả lớn duy nhất được bàn giao vào cuối dự án. Quản lý nhóm có xu hướng mang tính quan liêu hơn, với ít quyền tự chủ hơn.
    - Các dự án Waterfall có xu hướng được chỉ định rõ hơn ngay từ đầu và có ít sự mở rộng phạm vi hơn (thêm yêu cầu giữa dự án). Ngoài ra, các bản phát hành sản phẩm lớn hơn, ít thường xuyên hơn dễ xử lý hơn về mặt lập kế hoạch phát hành, marketing, cung cấp đào tạo và tài liệu, v.v.
    - Tuy nhiên, waterfall có xu hướng kém linh hoạt hơn và các thay đổi xảy ra chậm hơn nhiều. Việc chờ đợi vài tháng để sửa lỗi có thể gây frustration.
- **Agile**
  - : Đề cập đến việc chạy một dự án linh hoạt hơn, nơi nhiều giai đoạn có thể tiến triển đồng thời, và nhiều kết quả nhỏ hơn có xu hướng được bàn giao tại các mốc khác nhau trong suốt dự án. Sự thay đổi trong yêu cầu được kỳ vọng và có thể được xử lý bằng cách thay đổi ưu tiên khi cần. Các nhóm thường có nhiều quyền tự chủ hơn.
    - Các dự án Agile linh hoạt và có thể thích ứng dễ dàng hơn với các thay đổi trong yêu cầu. Nó cũng có thể tốt khi có các bản phát hành thường xuyên hơn — lỗi được sửa nhanh hơn, sự đổi mới xảy ra thường xuyên hơn, và luôn có điều gì đó để nhóm marketing nói về. Các nhóm Agile thường nói về cải tiến liên tục.
    - Tuy nhiên, có nhiều rủi ro mở rộng phạm vi và trượt thời hạn hơn, các dự án thường không bao giờ cảm thấy thực sự hoàn thành, và có nhịp độ và áp lực liên tục hơn để bàn giao.

> [!NOTE]
> Các nhóm phát triển web thường thích làm việc với quy trình agile, vì phát triển phần mềm theo bản chất của nó dễ bị thay đổi (đôi khi nhanh chóng) trong yêu cầu do các lỗi mới, phản hồi người dùng, chiến lược công ty, v.v.

### Scrum và Kanban

Có một loại phương pháp agile cụ thể gọi là **scrum**, có một tập hợp quy tắc cố định về cách chạy một dự án. Ví dụ:

- Người phụ trách scrum được gọi là scrum master. Đây thường chỉ là giám đốc dự án với tên khác.
- Công việc cần làm được chia thành các chu kỳ gọi là **sprint**, thường kéo dài hai tuần.
- Trước mỗi sprint, các công việc tiềm năng mới được thảo luận, và nếu được chấp nhận vào sprint, chúng được đưa vào backlog.
- Các công việc được lấy từ backlog và di chuyển qua các giai đoạn khác nhau để hoàn thành, chẳng hạn như "đang tiến hành" và "đang xem xét".
- Scrum master tổ chức các cuộc họp **stand-up** hàng ngày ngắn gọn nơi mọi người nói về tiến độ họ đã đạt được và bất kỳ vấn đề nào họ có thể gặp, để các vấn đề có thể được phát hiện sớm.
- Vào cuối mỗi sprint, scrum master tổ chức cuộc họp hồi tưởng để xem lại những gì đã diễn ra tốt, những gì không diễn ra tốt, và những bài học nào có thể rút ra trước sprint tiếp theo.

Một loại phương pháp agile khác được gọi là **kanban**, có ít quy tắc hơn scrum, không sử dụng sprint, và có xu hướng tập trung nhiều hơn vào các khía cạnh cải tiến liên tục của agile. Kanban đặc biệt hữu ích để quản lý các quy trình liên tục không có điểm kết thúc rõ ràng, chẳng hạn như phiếu hỗ trợ khách hàng.

### Bảng Kanban

Các công cụ như [Trello](https://trello.com/) và [Asana](https://asana.com/) cung cấp các trực quan hóa hiển thị trạng thái của các công việc khác nhau trong một dự án. Chúng thường được gọi là **bảng Kanban**, mặc dù chúng có thể được sử dụng để quản lý các loại quy trình khác nhau, không chỉ kanban. Bảng Kanban bao gồm các cột khác nhau, có thể đại diện cho các trạng thái công việc khác nhau trong một dự án scrum ("backlog", "todo", "đang tiến hành", v.v.), các loại công việc khác nhau ("nghiên cứu", "thiết kế", "phát triển", v.v.) hoặc bất cứ điều gì khác hữu ích cho dự án của bạn.

[GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects) cung cấp một lựa chọn công cụ tốt khác và miễn phí sử dụng — bạn chỉ cần đăng ký tài khoản GitHub.

## Thực hành với quy trình làm việc dự án

Bạn nên đọc về các quy trình trên và thực hành theo dõi một số công việc hoặc dự án cá nhân của bạn bằng cách sử dụng bảng kanban. Đừng lo lắng về việc sử dụng một phương pháp scrum phức tạp; kanban cơ bản là đủ cho lúc này. Ngay cả khi bạn đang làm một mình, việc thực hành quy trình làm việc có thể rất có ích:

1. Tạo các nhiệm vụ.
2. Quyết định chúng lớn như thế nào hoặc mất bao lâu.
3. Ưu tiên các nhiệm vụ.
4. Sắp xếp chúng theo thứ tự với ngày đến hạn.
5. Bắt đầu làm việc trên các nhiệm vụ khác nhau.
6. Đặt trạng thái của chúng ("đang tiến hành", "bị chặn", "hoàn thành", v.v.) khi công việc tiến triển.

Theo dõi tiến độ của một dự án hoàn chỉnh từ đầu đến cuối — thử với trang web của riêng bạn hoặc một dự án phụ nào đó. Ngoài ra, hãy thử [đóng góp cho một dự án mã nguồn mở](/vi/docs/Learn_web_development/Getting_started/Soft_skills/Collaboration_and_teamwork#participate_in_open_source) hoặc hai; nhiều trong số đó sẽ sử dụng một quy trình để theo dõi công việc của họ tương tự như những gì chúng tôi mô tả ở trên.

## Xem thêm

- [Tech Stack là gì và Chúng Hoạt động như thế nào?](https://www.mongodb.com/resources/basics/technology-stack), mongodb.com
- [Cấu trúc nhóm phát triển website: vai trò và quy trình](https://www.truemark.dev/blog/web-development-team-structure-role-process/), truemark.dev (2017)
- [Agile vs. Waterfall](https://www.productplan.com/learn/agile-vs-waterfall/), ProductPlan
- [Scrum là gì?](https://www.scrum.org/learning-series/what-is-scrum/), scrum.org

{{PreviousMenuNext("Learn_web_development/Getting_started/Soft_skills/Collaboration_and_teamwork", "Learn_web_development/Getting_started/Soft_skills/Finding_a_job", "Learn_web_development/Getting_started/Soft_skills")}}
