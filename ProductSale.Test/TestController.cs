using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Moq;
using NUnit.Framework;
using ProductSale.Controllers;
using ProductSale.Models;

namespace ProductSale.Test
{
    [TestFixture]
    public class TestController
    {
        private BuyerTestController controller;
        private Mock<IBuyer> mock;

        [SetUp]
        public void SetUp()
        {
            mock = new Mock<IBuyer>();
            controller = new BuyerTestController(mock.Object);
        }

        [Test]
        public void GetAllTest()
        {
            //arrange
            SetUp();
            mock.Setup(x => x.GetAll()).Returns(new List<BuyerTest>().AsQueryable());

            //act
            var result = controller.GetAll();

            //assert
            mock.Verify(x => x.GetAll(), Times.Once);
        }
        [Test]
        public void DeleteTest()
        {
            //Arrange
            SetUp();
            BuyerTest buyer = new BuyerTest();
            mock.Setup(x => x.Add(buyer));

            controller.Add(buyer);
            //Act
            var result = controller.Deletee(buyer.Id_Buyer);
            //Assert
            NUnit.Framework.Assert.IsInstanceOf<OkResult>(result);
        }

        [Test]
        public void UpdateTest()
        {
            //Arrange

            BuyerTest buyer = new BuyerTest { Name = "Name1", Login = "Login1" };
            mock.Setup(a => a.Add(buyer));
            string exp = "111";
            buyer.Name = exp;
            buyer.Login = exp;
            mock.Setup(a => a.Update(buyer));

            var result = controller.Update(buyer);

            Assert.IsInstanceOf<OkResult>(result);
            Assert.AreEqual(exp, buyer.Name);
            Assert.AreEqual(exp, buyer.Login);
        }        
    }
}
