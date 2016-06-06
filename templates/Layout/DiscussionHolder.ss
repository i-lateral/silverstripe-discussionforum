<div class="units-row">
    <div class="site-content typography <% if $SideBarView %>unit-75<% end_if %>">
        <% if $Tag %>
            <h1>Current tag: "{$Tag}"</h1>
        <% else_if $Category %>
            <h1>Current category: "{$Category.Title}"</h1>
        <% else %>
            <h1>$Title</h1>
        <% end_if %>

        <% if not $SideBarView && $canStartDiscussions %>
            <p class="discussions-start-button">
                <a class="btn btn-big btn-green" href="{$Link('start')}">
                    <% _t("Discussions.StartDiscussion", "Start new discussion") %>
                </a>
            </p>
        <% end_if %>

        <% if $ViewableDiscussions.Count == 0 %>
            <p>There are currenty no discussions.</p>

            <% if $canStartDiscussions %>
                <p class="discussions-start-button">
                    <a class="btn btn-big btn-green" href="{$Link('start')}">
                        <% _t("Discussions.StartDiscussion", "Start new discussion") %>
                    </a>
                </p>
            <% end_if %>
        <% else %>
            <div class="discussions">
                <% loop $ViewableDiscussions %>
                    <div class="discussion units-row">
                        <div class="discussion-content unit-80">
                            <h2>
                                <a href="{$Top.Link('view')}/{$ID}">$Title</a>
                                <% if $Liked %>
                                    <span class="label label-blue">
                                        <% _t("Discussions.Liked", "Liked") %>
                                    </span>
                                <% end_if %>
                                <% if $Reported %>
                                    <span class="label label-red">
                                        <% _t("Discussions.Reported", "Reported") %>
                                    </span>
                                <% end_if %>
                            </h2>

                            <% if $Author.Avatar %>
                                <img
                                    class="avatar"
                                    style="float: left; margin: 0 1em 1em 0;"
                                    src="$Author.Avatar.CroppedImage(75,75).URL"
                                    alt="Avatar for {$Author.Nickname}"
                                    title="Avatar for {$Author.Nickname}"
                                />
                            <% end_if %>

                            <p>
                                $Content.Summary(50)
                            </p>

                            <p>
                                <strong>$Author.FirstName $Author.Surname</strong>
                                $Created.Ago |

                                <% if $LikedBy.Count %>
                                    $LikedBy.Count
                                    <% if $LikedBy.Count == 1 %>
                                        Like;
                                    <% else %>
                                        Likes;
                                    <% end_if %>
                                <% end_if %>

                                $Comments.Count
                                <% if $Comments.Count == 1 %>
                                    <% _t("Discussions.Reply", "Reply") %>;
                                <% else %>
                                    <% _t("Discussions.Replies", "Replies") %>;
                                <% end_if %>
                            </p>

                            <p>
                                <% if $TagsCollection.exists %>
                                    <strong><% _t("Discussions.Tags", "Tags") %>:</strong>
                                    <% loop $TagsCollection %>
                                        <a href="$Link">$Tag</a><% if not $Last %>,<% end_if %>
                                    <% end_loop %>
                                <% end_if %>

                                <% if $Categories.exists %>
                                    <strong><% _t("Discussions.Categories", "Categories") %>:</strong>
                                    <% loop $Categories %>
                                        <a href="$Link">$Title</a><% if not $Last %>,<% end_if %>
                                    <% end_loop %>
                                <% end_if %>
                            </p>
                        </div>
                    </div>

                    <hr/>
                <% end_loop %>

                <% with $ViewableDiscussions %>
                    <% if $MoreThanOnePage %>
                        <ul class="pagination">
                            <% if $NotFirstPage %>
                                <li><a class="prev" href="$PrevLink">Prev</a></li>
                            <% end_if %>
                            <% loop $Pages %>
                                <% if $CurrentBool %>
                                    <li><span>$PageNum</span></li>
                                <% else %>
                                    <% if $Link %>
                                        <li><a href="$Link">$PageNum</a></li>
                                    <% else %>
                                        <li>...</li>
                                    <% end_if %>
                                <% end_if %>
                                <% end_loop %>
                            <% if $NotLastPage %>
                                <li><a class="next" href="$NextLink">Next</a></li>
                            <% end_if %>
                        </ul>
                    <% end_if %>
                <% end_with %>

            </div>
        <% end_if %>
    </div>

    <% include DiscussionsSidebar %>
</div>