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
}