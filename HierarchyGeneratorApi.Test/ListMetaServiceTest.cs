using HierarchyGeneratorApi.Services;

namespace HierarchyGeneratorApi.Test;

public class ListMetaServiceTest
{
    [Fact]
    public void CalculatePagination_NormalCaseShouldReturnFirstPage()
    {
        // Given
        int totalItems = 100;
        int page = 1;
        int limit = 5;

        // When
        IListMetaService listMetaService = new ListMetaService();
        var (startingIndex, itemsOnPage) = listMetaService.CalculatePagination(totalItems, page, limit);

        // Then
        Assert.Equal(0, startingIndex);
        Assert.Equal(5, itemsOnPage);
    }

    [Fact]
    public void CalculatePagination_NormalCaseShouldReturnSecondPage()
    {
        // Given
        int totalItems = 100;
        int page = 2;
        int limit = 5;

        // When
        IListMetaService listMetaService = new ListMetaService();
        var (startingIndex, itemsOnPage) = listMetaService.CalculatePagination(totalItems, page, limit);

        // Then
        Assert.Equal(5, startingIndex);
        Assert.Equal(5, itemsOnPage);
    }

    [Fact]
    public void CalculatePagination_ShouldReturnLastFullPage()
    {
        // Given
        int totalItems = 100;
        int page = 20;
        int limit = 5;

        // When
        IListMetaService listMetaService = new ListMetaService();
        var (startingIndex, itemsOnPage) = listMetaService.CalculatePagination(totalItems, page, limit);

        // Then
        Assert.Equal(95, startingIndex);
        Assert.Equal(5, itemsOnPage);
    }

    [Fact]
    public void CalculatePagination_PageBeyondLastItemShouldReturnNoItemsOnPage()
    {
        // Given
        int totalItems = 100;
        int page = 21;
        int limit = 5;

        // When
        IListMetaService listMetaService = new ListMetaService();
        var (startingIndex, itemsOnPage) = listMetaService.CalculatePagination(totalItems, page, limit);

        // Then
        Assert.Equal(100, startingIndex);
        Assert.Equal(0, itemsOnPage);
    }

    [Fact]
    public void CalculatePagination_ShouldReturnRemainingItemsOnLastPage()
    {
        // Given
        int totalItems = 7;
        int page = 2;
        int limit = 5;

        // When
        IListMetaService listMetaService = new ListMetaService();
        var (startingIndex, itemsOnPage) = listMetaService.CalculatePagination(totalItems, page, limit);

        // Then
        Assert.Equal(5, startingIndex);
        Assert.Equal(2, itemsOnPage);
    }

    [Fact]
    public void CalculatePagination_ShouldReturnNoItems()
    {
        // Given
        int totalItems = 0;
        int page = 1;
        int limit = 5;

        // When
        IListMetaService listMetaService = new ListMetaService();
        var (startingIndex, itemsOnPage) = listMetaService.CalculatePagination(totalItems, page, limit);

        // Then
        Assert.Equal(0, startingIndex);
        Assert.Equal(0, itemsOnPage);
    }
}