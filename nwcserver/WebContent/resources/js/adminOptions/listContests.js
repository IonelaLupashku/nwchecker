/**
 * Created by ReaktorDTR on 07.02.2015.
 */

$(document).ready(function () {
    $('#contestsData').on('click', 'tbody tr', function (event) {
        var contestId = $(this).find('td:nth-child(1)').html();
        var id = document.getElementById("id");
        id.value = contestId;
        $('#ContestUserTable').bootstrapTable('destroy');
        $.get('getContestUsersList.do?contestId=' + contestId, function (data) {
            $('#ContestUserTable').bootstrapTable({
                data: data
            });
        });
        tryToShowUserList();
    });

    $('body').on("click", "#submitUserListButton", function () {
        sendContestUsers();
    });

    $('#userListModal').on('hidden.bs.modal', function () {
        $('#contestsData').bootstrapTable('refresh');
    })
});